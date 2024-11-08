import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = "movie-screen";
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  bool isRefresh = false;
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorByMovieProvider.notifier).loadActors(widget.movieId);
  }
  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null){
      return const Center(child: CircularProgressIndicator(strokeWidth:  2,),);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return _MovieDetails(movie: movie);
          },
          childCount: 1)),
          const SizedBox(height: 20,),
          _ActorsByMovie(movieId: movie.id.toString()),
          const SizedBox(height: 50),

        ],
      ),
    );
  }
}

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId){
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.isMovieFavorite(movieId);
});

class _CustomSliverAppBar extends ConsumerWidget {
  final Movie movie;
  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context, ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(movie.id));
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(onPressed: () async{
          //ref.watch(localStorageRepositoryProvider).toggleFavorite(movie);
          await ref.watch(favoriteMoviesProvider.notifier).toggleFavorite(movie);
          ref.invalidate(isFavoriteProvider(movie.id));
        }, 
        icon: isFavoriteFuture.when(
          data: (isFavorite) => isFavorite? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_outline,), 
          error: (_, __) => throw UnimplementedError(), 
          loading: () => const CircularProgressIndicator(strokeWidth: 2,)
        )),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(movie.title, style: const TextStyle(fontSize: 20,), textAlign: TextAlign.start,),
        background: Stack(
          children: [
            
            const _CustomGradient(
              begin: Alignment.topRight, 
              end: Alignment.bottomLeft, 
              colors: [Colors.black, Colors.black87], 
              stops: [0.0, 0.2]
            ),
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder:(context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const _CustomGradient(
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
              colors: [Colors.black, Colors.black87], 
              stops: [0.7, 1.0]
            ),
            
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft, 
                    colors: [Colors.black, Colors.black87],
                    stops: [0.0, 0.4])
                )
              )
            ),
          ],

        ),
      ),
    
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath, width: size.width*0.3,),
              )
            ],),
          ),
        const Padding(padding: EdgeInsets.all(8)),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender)=> Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  label: Text(gender),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
              ))
            ],
          ),
          ),
        SizedBox(
          width:  (size.width - 40)*0.7,
          child: Column(
            children: [
              Text(movie.title, style:  textStyles.titleLarge,),
              Text(movie.overview)
            ],
          ),
        ),
        const SizedBox(width:  100,),
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;
  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsByMovie = ref.watch(actorByMovieProvider);
    if (actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2,);
    }
    final actors = actorsByMovie[movieId];
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: actors?.length ?? 0,
        
        itemBuilder:(context, index) {
          final actor = actors?[index];
          return Container(
            padding:  const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      actor!.profilePath,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover
                    ),
                  
                  ),
                ),
                const SizedBox(height: 5,),
                Text(actor.name, maxLines: 2,),
                Text(actor.character ?? "",
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),)
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  final List<double> stops;

  const _CustomGradient({required this.begin, required this.end, required this.colors, required this.stops});
  @override
 Widget build(BuildContext context) {
    return SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  
                  gradient: LinearGradient(
                    begin: begin, 
                    end: end, 
                    colors: colors,
                    stops: stops)
                )
              )
          );
  }
}