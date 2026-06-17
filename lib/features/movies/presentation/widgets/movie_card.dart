import 'package:flutter/material.dart';
import 'package:movies_test/core/theme/app_colors.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_title.dart';
import 'package:movies_test/features/movies/presentation/widgets/poster_image.dart';
import 'package:movies_test/features/movies/presentation/widgets/rate_widget.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  static const double posterHeight = 233;
  static const double cardHeight = posterHeight + 62; // постер + текст знизу

  final MovieModel movie;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MovieCard.posterHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                PosterImage(movie: movie),
                Positioned(top: 11, right: 14, child: _buildStar()),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: MovieTitle(title: movie.title),
        ),
        RateWidget(voteAverage: movie.voteAverage),
      ],
    );
  }

  Widget _buildStar() {
    return GestureDetector(
      onTap: onFavoriteTap,
      child: Icon(
        Icons.star_rounded,
        size: 20,
        color:
            isFavorite
                ? AppColors.favorite
                : AppColors.star.withValues(alpha: 0.6),
      ),
    );
  }
}
