import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/favorites_controller.dart';
import '../services/recipes_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/recipe_card.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;

  const RecipeListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesController>();
    final allRecipes = context.watch<RecipesController>().recipes;
    final recipes = allRecipes.where((r) => r.category == category).toList();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 900 ? 4 : (width > 600 ? 3 : 2);

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: recipes.isEmpty
          ? const EmptyState(
              icon: Icons.search_off,
              title: 'No recipes here yet',
              subtitle: 'Check back later for more recipes in this category.',
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCard(
                  recipe: recipe,
                  isFavorite: favorites.isFavorite(recipe.id),
                  onFavoriteTap: () => favorites.toggleFavorite(recipe.id),
                  onTap: () => context.push('/recipe/${recipe.id}'),
                );
              },
            ),
    );
  }
}
