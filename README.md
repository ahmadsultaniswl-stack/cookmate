# CookMate 🍳 — Flutter Recipe App

A complete cross-platform Flutter recipe app featuring six screens, GoRouter navigation with deep linking, Material Design 3 theming, responsive layouts, Hero animations, a validated recipe submission form, and local favorites storage.

<!--
📸 SCREENSHOT INSTRUCTIONS (delete this comment block once done):
1. Take screenshots (Home, Search, Recipe Detail, Favorites, Add Recipe, Category List).
2. Drag-and-drop images directly into this README while editing it on GitHub, OR
3. Create a folder named "screenshots" and reference them: ![Home](screenshots/home.png)
-->

## 📱 Screenshots

| Home | Search | Category List |
|------|--------|-------------------|
|<img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 40 AM" src="https://github.com/user-attachments/assets/14d31e62-042d-4471-b104-d91f90b5c1c1" /> | <img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 40 AM (1)" src="https://github.com/user-attachments/assets/8b590b54-ec68-4034-a369-15534c88f03a" /><img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 42 AM (1)" src="https://github.com/user-attachments/assets/b80c1941-fed6-4ec7-bc31-91920055c7ca" />
<img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 42 AM" src="https://github.com/user-attachments/assets/1621a4c4-45da-4395-8de0-a2a0abe2be09" />
<img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 41 AM (1)" src="https://github.com/user-attachments/assets/7bead058-b2fb-48f1-8b4c-c3433542f5e7" />
<img width="576" height="1280" alt="WhatsApp Image 2026-09-12 at 7 00 41 AM" src="https://github.com/user-attachments/assets/38fbe032-9d70-4611-8a30-8957ec7c60c1" />
 | _add screenshot_ |

| Recipe Detail | Favorites | Add Recipe |
|------------------|-----------|----------------|
| _add screenshot_ | _add screenshot_ | _add screenshot_ |

---

## ✨ Features

- 🧭 **6 screens** — Home, Recipe List (by category), Recipe Detail, Search, Favorites, Add Recipe
- 🧩 **Custom reusable widgets** — `RecipeCard`, `CategoryChip`, `EmptyState`
- 🔗 **GoRouter navigation with deep linking** — e.g. `/recipe/m3`, `/category/Dessert`
- 🎨 **Material Design 3 theming** — light and dark color schemes
- 📐 **Responsive grid layout** — 2 / 3 / 4 columns based on screen width
- 🎬 **Hero transition animations** — from recipe cards into the detail screen
- ✅ **Validated recipe submission form** — using `Form` + `TextFormField` validators
- 💾 **Local favorites storage** — persisted with `shared_preferences`
- 📊 **Hardcoded dataset** — 15 recipes across 3 categories (Breakfast, Main Course, Dessert)

---

## 🏗️ Architecture

A clean, layered folder structure separates data, business logic, and presentation:

| Folder | Responsibility |
|---|---|
| `models/` | Recipe data model (fromJson / toJson) |
| `data/` | Hardcoded JSON-style dataset (15 recipes) |
| `services/` | `FavoritesService` (shared_preferences) + `FavoritesController` (state) |
| `routes/` | GoRouter configuration with deep-linkable paths |
| `theme/` | Material 3 light/dark `ThemeData` |
| `widgets/` | Reusable UI components (RecipeCard, CategoryChip, EmptyState, RootShell) |
| `screens/` | Home, Recipe List, Recipe Detail, Search, Favorites, Add Recipe |

State management uses the `provider` package with a `ChangeNotifier` (`FavoritesController`), keeping favorite status in sync across Home, Search, Category, and Favorites screens without manual prop-drilling.

---

## 🧭 Navigation Structure

A `ShellRoute` keeps a persistent bottom navigation bar across Home, Search, and Favorites. Recipe Detail, Category List, and Add Recipe are pushed as full-screen routes, each with its own deep-linkable path.

| Path | Screen |
|---|---|
| `/` | Home — category shortcuts + grid of all recipes |
| `/category/:categoryName` | Recipe List filtered by category |
| `/recipe/:id` | Recipe Detail — ingredients, steps, Hero image |
| `/search` | Search — live text filter + category chips |
| `/favorites` | Favorites — saved recipes (persisted locally) |
| `/add-recipe` | Add Recipe — validated submission form |

---

## 💾 Local Storage & State

Since recipe content is static, only favorite recipe IDs need to persist across app restarts. A `Set<String>` of favorite IDs is stored via `shared_preferences` as a string list. `FavoritesController` (a `ChangeNotifier`) loads this set on startup and notifies all listening widgets whenever a favorite is toggled, so the heart icon stays in sync everywhere it appears.

---

## ✅ Forms & Validation

The Add Recipe screen uses a `Form` with a `GlobalKey<FormState>` and per-field `TextFormField` validators — title requires at least 3 characters, description and ingredients/steps cannot be empty, and cook time / servings must be valid positive numbers. On successful validation, the new recipe is appended to the in-memory dataset and immediately appears across Home, Search, and its category list.

---

## 🎬 Animations

Recipe images use a `Hero` widget shared between the `RecipeCard` and the Recipe Detail screen, producing a smooth flight animation when opening a recipe. Category chips use `AnimatedContainer` for smooth selection-state transitions.

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter, Dart |
| Navigation | GoRouter (deep linking) |
| State Management | Provider (ChangeNotifier) |
| Local Storage | shared_preferences |
| Design | Material Design 3 |

---

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/ahmadsultaniswl-stack/cookmate.git
cd cookmate

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 👤 Author

**Saie Ahmad**
Flutter Mobile App Developer
📧 ahmadsultaniswl@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/saieahmadsultan)
