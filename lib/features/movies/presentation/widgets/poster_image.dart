import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/core/theme/app_colors.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class PosterImage extends StatelessWidget {
  final MovieModel movie;
  const PosterImage({super.key, required this.movie});

  static const _placeholder = ColoredBox(color: AppColors.searchBackground);
  static const _errorWidget = ColoredBox(
    color: AppColors.searchBackground,
    child: Icon(Icons.movie_outlined, color: AppColors.text),
  );

  @override
  Widget build(BuildContext context) {
    if (movie.posterPath == null) return _errorWidget;

    return CachedNetworkImage(
      imageUrl: ApiConstants.posterUrl(movie.posterPath!),
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder: (_, __) => _placeholder,
      errorWidget: (_, __, ___) => _errorWidget,
    );
  }
}
