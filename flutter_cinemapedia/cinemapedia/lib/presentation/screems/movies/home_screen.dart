import 'package:cinemapedia/presentation/providers.dart';
import 'package:cinemapedia/presentation/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  _HomeView(),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget{
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {
  @override
void initState(){
  super.initState();
  ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  ref.read( popularMoviesProvider.notifier ).loadNextPage();
  ref.read( upComingMoviesProvider.notifier ).loadNextPage();
  ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
}
  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final upComingMovies = ref.watch( upComingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final moviesSlidesShow = ref.watch( moviesSlidesShowProvider );
    if ( moviesSlidesShow.isEmpty ) return const CircularProgressIndicator();
    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
            title: Text("Hello"),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index){
              return Column(
                      children: [
                        //const CustomAppbar(),
                        MoviesSlideshow(movies: moviesSlidesShow),
                        MovieHorizontalListview(
                          movies: nowPlayingMovies,
                          title: "En cines",
                          subTitle: "Today",
                          loadNextPage: (){
                            ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                          },
                        ),
                    
                        MovieHorizontalListview(
                          movies: popularMovies,
                          title: "Populares",
                          subTitle: "Today",
                          loadNextPage: (){
                            ref.read(popularMoviesProvider.notifier).loadNextPage();
                          },
                        ),
                        MovieHorizontalListview(
                          movies: upComingMovies,
                          title: "Recientes",
                          subTitle: "Today",
                          loadNextPage: (){
                            ref.read(upComingMoviesProvider.notifier).loadNextPage();
                          },
                        ),
                        MovieHorizontalListview(
                          movies: topRatedMovies,
                          title: "Mejor calificadas",
                          subTitle: "Today",
                          loadNextPage: (){
                            ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                          },
                        ),
                        const SizedBox(height: 10,)
                      ],
                    );
            },
            childCount: 1
          )),
      ]
      ),
    );
  }
}
/*
  const CustomAppbar(),
        Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder:(context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title)
              );  
            },
          ),
        ),
 */