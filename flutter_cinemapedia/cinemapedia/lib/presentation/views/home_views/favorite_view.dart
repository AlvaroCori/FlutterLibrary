import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {
  
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async{
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty ){
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    final colors = Theme.of(context).colorScheme;
    if (favoriteMovies.isEmpty){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            const Text("Sin favoritos en lista.", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 75, 136))),
            const SizedBox(height: 20,),
            FilledButton(onPressed: (){
              context.go("/home/0");
            }, 
            child: const Text("Empieza a buscar"))
        ],)
      );
    }
    return Scaffold(
      
      body: MovieMasonry(movies: favoriteMovies, loadNextPage: loadNextPage,),);
  }
}