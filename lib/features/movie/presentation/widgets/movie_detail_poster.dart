import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({super.key, required this.posterPath});

  final String? posterPath;

  static const double horizontalPadding = 46;
  static const double borderRadius = 15;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width - horizontalPadding * 2;
    final height = (width * 1.5).clamp(0.0, 357.0);

    Widget image;
    if (posterPath == null) {
      image = Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.searchBackground,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: const Icon(Icons.movie_outlined, size: 64, color: AppColors.text),
      );
    } else {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: ApiConstants.posterUrl(posterPath!),
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(
            width: double.infinity,
            height: height,
            color: AppColors.searchBackground,
          ),
          errorWidget: (_, __, ___) => Container(
            width: double.infinity,
            height: height,
            color: AppColors.searchBackground,
            child: const Icon(Icons.movie_outlined, size: 64, color: AppColors.text),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: image,
    );
  }
}
