import 'package:cinemapedia/presentation/alternative_views/movies/a_home_view.dart';
import 'package:cinemapedia/presentation/screems/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/favorite_view.dart';
import 'package:go_router/go_router.dart';
final appRouter = GoRouter(
  initialLocation: "/home/0",
  routes: [
        GoRoute(
          path: "/home/:page",
          name: HomeScreen.name,
          builder:(context, state) {
            final pageIndex = int.parse(state.pathParameters["page"] ?? "0");
            return HomeScreen(childView: const AHomeView(), pageIndex: pageIndex > 2? 0 : pageIndex,);
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
        GoRoute(
          path: "/",
          redirect: (_, __) {
            return "/home/0";
          },
        )
  ]
);
