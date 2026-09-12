import 'package:shared_preferences/shared_preferences.dart';

/// Handles persisting favorite recipe IDs locally using shared_preferences.
class FavoritesService {
  static const String _key = 'favorite_recipe_ids';

  Future<Set<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.toSet();
  }

  Future<void> toggleFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    if (list.contains(recipeId)) {
      list.remove(recipeId);
    } else {
      list.add(recipeId);
    }
    await prefs.setStringList(_key, list);
  }

  Future<bool> isFavorite(String recipeId) async {
    final ids = await getFavoriteIds();
    return ids.contains(recipeId);
  }
}
