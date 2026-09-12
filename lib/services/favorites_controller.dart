import 'package:flutter/foundation.dart';
import 'favorites_service.dart';

/// App-wide reactive controller for favorite recipes.
/// Wraps [FavoritesService] and notifies listeners on change.
class FavoritesController extends ChangeNotifier {
  final FavoritesService _service = FavoritesService();
  Set<String> _favoriteIds = {};
  bool _loaded = false;

  Set<String> get favoriteIds => _favoriteIds;
  bool get isLoaded => _loaded;

  FavoritesController() {
    _load();
  }

  Future<void> _load() async {
    _favoriteIds = await _service.getFavoriteIds();
    _loaded = true;
    notifyListeners();
  }

  bool isFavorite(String recipeId) => _favoriteIds.contains(recipeId);

  Future<void> toggleFavorite(String recipeId) async {
    await _service.toggleFavorite(recipeId);
    if (_favoriteIds.contains(recipeId)) {
      _favoriteIds.remove(recipeId);
    } else {
      _favoriteIds.add(recipeId);
    }
    notifyListeners();
  }
}
