import 'package:flutter/material.dart';
import 'package:movies_test/features/movie/presentation/widgets/movie_detail_overview.dart';
import 'package:movies_test/features/movie/presentation/widgets/movie_detail_poster.dart';
import 'package:movies_test/features/movie/presentation/widgets/movie_detail_rating.dart';
import 'package:movies_test/features/movie/presentation/widgets/movie_detail_release_date.dart';
import 'package:movies_test/shared/models/movie_model.dart';
import 'package:movies_test/shared/widgets/app_button.dart';
import 'package:movies_test/shared/widgets/app_content_padding.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final MovieModel movie;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppContentPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Column(
              spacing: 8,
              children: [
                MovieDetailPoster(posterPath: movie.posterPath),
                MovieDetailRating(voteAverage: movie.voteAverage),
              ],
            ),
            if (movie.overview != null && movie.overview!.isNotEmpty)
              MovieDetailOverview(overview: movie.overview!),
            if (movie.releaseDate != null && movie.releaseDate!.isNotEmpty)
              MovieDetailReleaseDate(releaseDate: movie.releaseDate!),
            AppButton(
              label: isFavorite ? 'Remove from favorites' : 'Add to favorites',
              style: isFavorite
                  ? AppButtonStyle.outlined
                  : AppButtonStyle.filled,
              onPressed: onToggleFavorite,
            ),
          ],
        ),
      ),
    );
  }
}
