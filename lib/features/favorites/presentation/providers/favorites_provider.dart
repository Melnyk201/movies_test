import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/features/favorites/data/favorites_service.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class FavoritesNotifier extends ChangeNotifier {
  FavoritesNotifier() {
    _load();
  }

  final _service = FavoritesService();
  Set<int> _favoriteIds = {};

  Future<void> _load() async {
    _favoriteIds = await _service.loadIds();
    notifyListeners();
  }

  bool isFavorite(int? id) => id != null && _favoriteIds.contains(id);

  Future<void> toggle(MovieModel movie) async {
    if (movie.id == null) return;
    if (isFavorite(movie.id)) {
      _favoriteIds = {..._favoriteIds}..remove(movie.id);
    } else {
      _favoriteIds = {..._favoriteIds, movie.id!};
    }
    notifyListeners();
    await _service.saveIds(_favoriteIds);
  }
}

final favoritesProvider = ChangeNotifierProvider<FavoritesNotifier>(
  (ref) => FavoritesNotifier(),
);
