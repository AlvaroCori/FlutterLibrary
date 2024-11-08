import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/shared/full_screen_loader.dart';
import 'package:cinemapedia/presentation/widgets/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget{
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}


class HomeViewState extends ConsumerState<HomeView> {
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

          
          
      
*/
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