import 'package:cinemapedia/presentation/screems/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/favorite_view.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/views/home_views/home_view.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {

        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: "/",
          builder:(context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: "movie/:id",
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters["id"]?? "no-id";
              return MovieScreen(movieId: movieId,);
              },
            ),
          ]
        ),
         GoRoute(
          path: "/favorites",
          builder:(context, state) {
            return const FavoriteView();
          },
        ),
      ]),
  ]
);

/*
final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen( childView: HomeView(),),
    ),
    GoRoute(
      path: "movie/:id",
      name: MovieScreen.name,
      builder: (context, state) {
        final movieId = state.pathParameters["id"]?? "no-id";
       return MovieScreen(movieId: movieId,);
      },
    ),
  ],
);
*/