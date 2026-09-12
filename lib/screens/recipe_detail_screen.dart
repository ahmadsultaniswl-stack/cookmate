import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';
import '../services/favorites_controller.dart';
import '../services/recipes_controller.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final Recipe? recipe = context.watch<RecipesController>().getById(recipeId);

    if (recipe == null) {
      return const Scaffold(body: Center(child: Text('Recipe not found')));
    }

    final favorites = context.watch<FavoritesController>();
    final isFav = favorites.isFavorite(recipe.id);
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'recipe-image-${recipe.id}',
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.restaurant, size: 60),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.redAccent : Colors.white,
                ),
                onPressed: () => favorites.toggleFavorite(recipe.id),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.title, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _InfoPill(
                          icon: Icons.timer_outlined,
                          label: '${recipe.cookTimeMinutes} min'),
                      _InfoPill(
                          icon: Icons.bar_chart, label: recipe.difficulty),
                      _InfoPill(
                          icon: Icons.people_outline,
                          label: '${recipe.servings} servings'),
                      _InfoPill(
                          icon: Icons.local_fire_department_outlined,
                          label: '${recipe.calories} kcal'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(recipe.description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Text('Ingredients',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...recipe.ingredients.map(
                    (ing) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.circle, size: 6),
                          const SizedBox(width: 10),
                          Expanded(
                              child:
                                  Text(ing, style: theme.textTheme.bodyMedium)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Steps',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ...recipe.steps.asMap().entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor:
                                    theme.colorScheme.primaryContainer,
                                child: Text('${entry.key + 1}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(entry.value,
                                      style: theme.textTheme.bodyMedium)),
                            ],
                          ),
                        ),
                      ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
