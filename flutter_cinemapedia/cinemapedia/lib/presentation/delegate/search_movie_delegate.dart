import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate {
  final SearchMoviesCallBack searchMovies;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debouncerTimer;
  List<Movie> initialMovies;

  SearchMovieDelegate(
      {
        super.searchFieldLabel,
        super.searchFieldStyle,
        super.searchFieldDecorationTheme,
        super.keyboardType,
        super.textInputAction,
        required this.searchMovies,
        required this.initialMovies
      });
  void _onQueeryChanged(String query) {
    isLoadingStream.add(true);
    if (_debouncerTimer?.isActive ?? false) _debouncerTimer?.cancel();
    _debouncerTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        debounceMovies.add([]);
        return;
      }
      final movies = await searchMovies(query);
      initialMovies = movies;
      debounceMovies.add(movies);
      isLoadingStream.add(false);

    });
  }

  void clearStreams() {
    debounceMovies.close();
    isLoadingStream.close();
  }

  @override
  String get searchFieldLabel => "Buscar pelicula";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream, 
        builder:(context, snapshot) {
          if (snapshot.data ?? false ){
            return SpinPerfect(
              animate: query.isNotEmpty,
              duration: const Duration(milliseconds: 5000),
              spins: 10,
              child: IconButton(
                onPressed: () => query = "", icon: const Icon(Icons.refresh_rounded))
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            duration: const Duration(milliseconds: 500),
            child: IconButton(
                onPressed: () => query = "", icon: const Icon(Icons.clear))
          );

        },),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  Widget buildResultsAndSuggestions(){
    return StreamBuilder(
        stream: debounceMovies.stream,
        //future: searchMovies(query),
        initialData: initialMovies,
        builder: (context, snapshot) {
          //final tempMovies = debounceMovies.stream.last;

          final movies = snapshot.data ?? [];
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return _MovieItem(
                  movie: movie,
                  onMovieSelected: (movie) {
                    clearStreams();
                    close(context, movie);
                  });
            },
          );
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueeryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({required this.movie, required this.onMovieSelected});
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onMovieSelected();
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    loadingBuilder: (context, child, loadingProgress) {
                      return FadeIn(child: child);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      style: textStyles.titleMedium,
                    ),
                    (movie.overview.length > 100)
                        ? Text(
                            '${movie.overview.substring(0, 100)}...',
                          )
                        : Text(movie.overview),
                    Row(
                      children: [
                        const Icon(Icons.star_half_rounded,
                            color: Colors.amber),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          HumanFormats.number(movie.voteAverage, 2),
                          style: textStyles.bodyMedium!
                              .copyWith(color: Colors.amber),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
