import 'package:cinemapedia/presentation/delegate/search_movie_delegate.dart';
//import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined,color: colors.primary,),
              const SizedBox( width: 5),
              Text("Cinemapedia", style: titleStyle,),
              const Spacer(),
              IconButton(onPressed: (){
                //final searchedMovies = ref.read(searchMoviesProvider);
                final searchQuery = ref.read(searchQueryProvider);

                showSearch(
                  query: searchQuery,
                  context: context, 
                  delegate: SearchMovieDelegate( 
                    initialMovies: [],
                    searchMovies: ref.read(searchMoviesProvider.notifier).searchMoviesByQuery
                )
                ).then((movie){
                  if (movie == null) return;  
                  // ignore: use_build_context_synchronously
                  context.push("/movie/${movie.id}");
                  //context.push("home/0/movie/${movie.id}");
                });
                
              },
               icon: const Icon(Icons.search))
            ]
          ,),
        )
      )
    );
  }
}