# CookMate 🍳

A cross-platform Flutter recipe app built for **Phase 1: Flutter Foundations and UI Mastery**.

## Features

- **5+ screens**: Home, Recipe List (by category), Recipe Detail, Search, Favorites, Add Recipe (submission form)
- **Custom reusable widgets**: `RecipeCard`, `CategoryChip`, `EmptyState`
- **GoRouter navigation** with deep linking (`/recipe/:id`, `/category/:categoryName`, `/search`, `/favorites`, `/add-recipe`)
- **Material Design 3** theming (light + dark, dynamic color scheme from a seed color)
- **Responsive layout**: grid column count adapts to screen width (2 / 3 / 4 columns)
- **Animations**: Hero transitions from recipe cards into the detail screen, animated chip selection
- **Validated recipe submission form** with `Form` + `TextFormField` validators
- **Local storage**: favorites persisted on-device using `shared_preferences`
- **Hardcoded dataset**: 15 recipes across 3 categories (Breakfast, Main Course, Dessert)

## Architecture

```
lib/
├── main.dart                  # App entry point, theme + router + provider setup
├── models/
│   └── recipe.dart            # Recipe data model (fromJson/toJson)
├── data/
│   └── recipes_data.dart      # Hardcoded JSON-style dataset (15 recipes)
├── services/
│   ├── favorites_service.dart     # shared_preferences read/write
│   └── favorites_controller.dart  # ChangeNotifier wrapper for reactive UI
├── routes/
│   └── app_router.dart        # GoRouter configuration (deep linking)
├── theme/
│   └── app_theme.dart         # Material 3 light/dark ThemeData
├── widgets/
│   ├── recipe_card.dart       # Reusable card with Hero image
│   ├── category_chip.dart     # Reusable filter chip
│   ├── empty_state.dart       # Reusable empty/no-results placeholder
│   └── root_shell.dart        # Bottom navigation shell
└── screens/
    ├── home_screen.dart
    ├── recipe_list_screen.dart
    ├── recipe_detail_screen.dart
    ├── search_screen.dart
    ├── favorites_screen.dart
    └── add_recipe_screen.dart
```

**State management**: `provider` + `ChangeNotifier` (`FavoritesController`) keeps favorite status in sync across Home, Search, Category, and Favorites screens without prop-drilling.

**Navigation**: A `ShellRoute` keeps the bottom navigation bar persistent across Home / Search / Favorites, while Recipe Detail, Category List, and Add Recipe are pushed as full-screen routes on top — each with its own deep-linkable path.

**Local storage**: Only favorite recipe IDs are persisted (a `Set<String>` written as a string list) via `shared_preferences`, keeping storage lightweight since recipe content itself is static/hardcoded.

## Getting Started

```bash
flutter pub get
flutter run
```

## Screens

| Screen | Path | Description |
|---|---|---|
| Home | `/` | Category shortcuts + grid of all recipes |
| Category List | `/category/:categoryName` | Recipes filtered by category |
| Recipe Detail | `/recipe/:id` | Full recipe with ingredients & steps, Hero image |
| Search | `/search` | Live search + category filter |
| Favorites | `/favorites` | Saved recipes (persisted locally) |
| Add Recipe | `/add-recipe` | Validated form to submit a new recipe |

## Tech Stack

- Flutter (Material 3)
- go_router — navigation & deep linking
- provider — state management
- shared_preferences — local persistence

## Conclusion

CookMate demonstrates a complete Flutter Phase 1 foundation: structured navigation, reusable component design, responsive layouts, Material 3 theming, form validation, and local persistence — all built on a clean, scalable folder architecture ready for a future backend integration.
