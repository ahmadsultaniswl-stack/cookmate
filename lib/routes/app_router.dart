import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/recipe_list_screen.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/add_recipe_screen.dart';
import '../widgets/root_shell.dart';

/// Central GoRouter configuration.
/// Every route is a distinct path, so links like `/recipe/m3` or
/// `/category/Dessert` work as deep links straight into the app.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => RootShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/search',
          name: 'search',
          pageBuilder: (context, state) => const NoTransitionPage(child: SearchScreen()),
        ),
        GoRoute(
          path: '/favorites',
          name: 'favorites',
          pageBuilder: (context, state) => const NoTransitionPage(child: FavoritesScreen()),
        ),
      ],
    ),
    // Full-screen routes (pushed above the shell, with default transitions)
    GoRoute(
      path: '/category/:categoryName',
      name: 'category',
      builder: (context, state) {
        final category = state.pathParameters['categoryName']!;
        return RecipeListScreen(category: category);
      },
    ),
    GoRoute(
      path: '/recipe/:id',
      name: 'recipe-detail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RecipeDetailScreen(recipeId: id);
      },
    ),
    GoRoute(
      path: '/add-recipe',
      name: 'add-recipe',
      builder: (context, state) => const AddRecipeScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Page not found: ${state.uri}')),
  ),
);
