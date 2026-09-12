import 'package:flutter/foundation.dart';
import '../data/recipes_data.dart';
import '../models/recipe.dart';

/// App-wide reactive controller for the recipe list.
/// Wraps the seed dataset and notifies listeners whenever a new
/// recipe is submitted, so Home/Search/Category/Favorites screens
/// update immediately instead of showing a stale list.
class RecipesController extends ChangeNotifier {
  final List<Recipe> _recipes = List<Recipe>.from(hardcodedRecipes);

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  Recipe? getById(String id) {
    final matches = _recipes.where((r) => r.id == id);
    return matches.isEmpty ? null : matches.first;
  }
}