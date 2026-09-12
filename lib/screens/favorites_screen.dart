import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/favorites_controller.dart';
import '../services/recipes_controller.dart';
import '../widgets/empty_state.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesController>();
    final allRecipes = context.watch<RecipesController>().recipes;
    final favoriteRecipes =
        allRecipes.where((r) => favorites.isFavorite(r.id)).toList();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 900 ? 4 : (width > 600 ? 3 : 2);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: !favorites.isLoaded
          ? const Center(child: CircularProgressIndicator())
          : favoriteRecipes.isEmpty
              ? const EmptyState(
                  icon: Icons.favorite_border,
                  title: 'No favorites yet',
                  subtitle: 'Tap the heart icon on any recipe to save it here.',
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: favoriteRecipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final recipe = favoriteRecipes[index];
                    return RecipeCard(
                      recipe: recipe,
                      isFavorite: true,
                      onFavoriteTap: () => favorites.toggleFavorite(recipe.id),
                      onTap: () => context.push('/recipe/${recipe.id}'),
                    );
                  },
                ),
    );
  }
}
