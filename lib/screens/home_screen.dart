import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/recipes_data.dart';
import '../services/favorites_controller.dart';
import '../services/recipes_controller.dart';
import '../widgets/category_chip.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesController>();
    final recipes = context.watch<RecipesController>().recipes;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 900 ? 4 : (width > 600 ? 3 : 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CookMate 🍳'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Add Recipe',
            onPressed: () => context.push('/add-recipe'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'What are we cooking today?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recipeCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = recipeCategories[index];
                  return CategoryChip(
                    label: category,
                    selected: false,
                    onTap: () => context.push('/category/$category'),
                    icon: _iconFor(category),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('All Recipes', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }

  IconData _iconFor(String category) {
    switch (category) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Main Course':
        return Icons.dinner_dining;
      case 'Dessert':
        return Icons.icecream;
      default:
        return Icons.restaurant_menu;
    }
  }
}
