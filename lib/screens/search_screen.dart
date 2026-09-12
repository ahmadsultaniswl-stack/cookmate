import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/recipes_data.dart';
import '../models/recipe.dart';
import '../services/favorites_controller.dart';
import '../services/recipes_controller.dart';
import '../widgets/category_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/recipe_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';
  String? _selectedCategory;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Recipe> _filter(List<Recipe> source) {
    return source.where((r) {
      final matchesQuery = _query.isEmpty ||
          r.title.toLowerCase().contains(_query.toLowerCase());
      final matchesCategory =
          _selectedCategory == null || r.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesController>();
    final allRecipes = context.watch<RecipesController>().recipes;
    final results = _filter(allRecipes);
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 900 ? 4 : (width > 600 ? 3 : 2);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Recipes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recipeCategories.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CategoryChip(
                      label: 'All',
                      selected: _selectedCategory == null,
                      onTap: () => setState(() => _selectedCategory = null),
                    );
                  }
                  final category = recipeCategories[index - 1];
                  return CategoryChip(
                    label: category,
                    selected: _selectedCategory == category,
                    onTap: () => setState(() => _selectedCategory = category),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: results.isEmpty
                  ? const EmptyState(
                      icon: Icons.search_off,
                      title: 'No matches found',
                      subtitle: 'Try a different keyword or category.',
                    )
                  : GridView.builder(
                      itemCount: results.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final recipe = results[index];
                        return RecipeCard(
                          recipe: recipe,
                          isFavorite: favorites.isFavorite(recipe.id),
                          onFavoriteTap: () =>
                              favorites.toggleFavorite(recipe.id),
                          onTap: () => context.push('/recipe/${recipe.id}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
