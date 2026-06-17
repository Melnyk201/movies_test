import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = 'favorites';

  Future<Set<int>> loadIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.map(int.parse).toSet();
  }

  Future<void> saveIds(Set<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.map((id) => id.toString()).toList());
  }
}
