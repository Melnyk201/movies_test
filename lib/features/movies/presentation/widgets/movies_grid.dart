import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_test/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_card.dart';
import 'package:movies_test/router/app_router.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class MoviesGrid extends ConsumerWidget {
  const MoviesGrid({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: MovieCard.cardHeight,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final isFavorite = ref.watch(favoritesProvider).isFavorite(movie.id);
        return MovieCard(
          movie: movie,
          isFavorite: isFavorite,
          onTap: () => context.push(AppRoutes.movieDetails, extra: movie.id),
        );
      },
    );
  }
}
