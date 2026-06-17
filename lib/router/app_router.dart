import 'package:go_router/go_router.dart';
import 'package:movies_test/features/movie/presentation/pages/movie_details_page.dart';
import 'package:movies_test/features/movies/presentation/pages/all_movies_page.dart';
import 'package:movies_test/features/movies/presentation/pages/search_movie_page.dart';

abstract final class AppRoutes {
  static const allMovies = '/';

  static const _search = 'search';
  static const searchMovie = '/$_search';

  static const _movieDetails = 'movie';
  static const movieDetails = '/$_movieDetails';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.allMovies,
  routes: [
    GoRoute(
      path: AppRoutes.allMovies,
      builder: (context, state) => const AllMoviesPage(),
      routes: [
        GoRoute(
          path: AppRoutes._search,
          builder: (context, state) => const SearchMoviePage(),
        ),
        GoRoute(
          path: AppRoutes._movieDetails,
          builder: (context, state) {
            final movieId = state.extra as int;
            return MovieDetailsPage(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
