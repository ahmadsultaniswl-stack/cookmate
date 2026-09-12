import '../models/recipe.dart';

/// Hardcoded recipe data (simulates a JSON dataset) — 15 recipes
/// across 3 categories: Breakfast, Main Course, Dessert.
final List<Map<String, dynamic>> recipesJson = [
  // ---------------- BREAKFAST (5) ----------------
  {
    "id": "b1",
    "title": "Fluffy Pancakes",
    "category": "Breakfast",
    "imageUrl": "https://loremflickr.com/600/400/pancakes,food",
    "cookTimeMinutes": 20,
    "difficulty": "Easy",
    "servings": 2,
    "calories": 350,
    "description":
        "Light, fluffy pancakes served with maple syrup and fresh berries.",
    "ingredients": [
      "1 cup all-purpose flour",
      "2 tbsp sugar",
      "1 tbsp baking powder",
      "1 cup milk",
      "1 egg",
      "2 tbsp melted butter",
      "Pinch of salt"
    ],
    "steps": [
      "Whisk dry ingredients together in a bowl.",
      "Add milk, egg, and melted butter; mix until just combined.",
      "Heat a non-stick pan over medium heat and grease lightly.",
      "Pour batter and cook until bubbles form, then flip.",
      "Cook other side until golden. Serve warm."
    ]
  },
  {
    "id": "b2",
    "title": "Avocado Toast",
    "category": "Breakfast",
    "imageUrl": "https://loremflickr.com/600/400/avocado-toast,food",
    "cookTimeMinutes": 10,
    "difficulty": "Easy",
    "servings": 1,
    "calories": 250,
    "description":
        "Crispy sourdough topped with creamy mashed avocado and chili flakes.",
    "ingredients": [
      "1 slice sourdough bread",
      "1 ripe avocado",
      "1/2 lemon (juiced)",
      "Chili flakes",
      "Salt and pepper"
    ],
    "steps": [
      "Toast the sourdough bread until golden.",
      "Mash avocado with lemon juice, salt, and pepper.",
      "Spread avocado mixture on toast.",
      "Sprinkle chili flakes on top and serve."
    ]
  },
  {
    "id": "b3",
    "title": "Vegetable Omelette",
    "category": "Breakfast",
    "imageUrl": "https://loremflickr.com/600/400/omelette,food",
    "cookTimeMinutes": 15,
    "difficulty": "Easy",
    "servings": 1,
    "calories": 300,
    "description":
        "A protein-packed omelette loaded with fresh bell peppers, onions, and cheese.",
    "ingredients": [
      "3 eggs",
      "1/4 cup chopped bell peppers",
      "1/4 cup chopped onions",
      "2 tbsp shredded cheese",
      "Salt and pepper"
    ],
    "steps": [
      "Beat eggs with salt and pepper.",
      "Saute onions and peppers in a pan until soft.",
      "Pour eggs over vegetables and cook on low heat.",
      "Sprinkle cheese, fold omelette, and serve hot."
    ]
  },
  {
    "id": "b4",
    "title": "Overnight Oats",
    "category": "Breakfast",
    "imageUrl": "https://loremflickr.com/600/400/oats,food",
    "cookTimeMinutes": 5,
    "difficulty": "Easy",
    "servings": 1,
    "calories": 280,
    "description":
        "No-cook oats soaked overnight in milk, topped with honey and fruit.",
    "ingredients": [
      "1/2 cup rolled oats",
      "1/2 cup milk",
      "1 tbsp honey",
      "1/2 banana, sliced",
      "A handful of berries"
    ],
    "steps": [
      "Combine oats, milk, and honey in a jar.",
      "Stir well and refrigerate overnight.",
      "Top with banana and berries before serving."
    ]
  },
  {
    "id": "b5",
    "title": "Classic French Toast",
    "category": "Breakfast",
    "imageUrl": "https://loremflickr.com/600/400/french-toast,food",
    "cookTimeMinutes": 15,
    "difficulty": "Medium",
    "servings": 2,
    "calories": 400,
    "description": "Golden, custardy French toast dusted with cinnamon sugar.",
    "ingredients": [
      "4 slices thick bread",
      "2 eggs",
      "1/2 cup milk",
      "1 tsp cinnamon",
      "1 tbsp sugar",
      "Butter for frying"
    ],
    "steps": [
      "Whisk eggs, milk, cinnamon, and sugar together.",
      "Dip each bread slice into the mixture, coating both sides.",
      "Fry in buttered pan until golden on both sides.",
      "Serve with syrup or powdered sugar."
    ]
  },

  // ---------------- MAIN COURSE (5) ----------------
  {
    "id": "m1",
    "title": "Creamy Chicken Alfredo",
    "category": "Main Course",
    "imageUrl": "https://loremflickr.com/600/400/chicken-alfredo,pasta",
    "cookTimeMinutes": 35,
    "difficulty": "Medium",
    "servings": 4,
    "calories": 620,
    "description":
        "Rich and creamy pasta tossed with grilled chicken and parmesan.",
    "ingredients": [
      "300g fettuccine pasta",
      "2 chicken breasts, sliced",
      "1 cup heavy cream",
      "1 cup grated parmesan",
      "3 cloves garlic, minced",
      "2 tbsp butter"
    ],
    "steps": [
      "Cook fettuccine according to package instructions.",
      "Season and pan-sear chicken until cooked through; set aside.",
      "Saute garlic in butter, add cream and simmer.",
      "Stir in parmesan until sauce thickens.",
      "Toss pasta and chicken in sauce and serve."
    ]
  },
  {
    "id": "m2",
    "title": "Beef Stir Fry",
    "category": "Main Course",
    "imageUrl": "https://loremflickr.com/600/400/beef,stirfry",
    "cookTimeMinutes": 25,
    "difficulty": "Medium",
    "servings": 3,
    "calories": 480,
    "description":
        "Tender beef strips stir-fried with crisp vegetables in savory sauce.",
    "ingredients": [
      "300g beef sirloin, sliced thin",
      "1 bell pepper, sliced",
      "1 carrot, julienned",
      "3 tbsp soy sauce",
      "1 tbsp oyster sauce",
      "2 cloves garlic, minced"
    ],
    "steps": [
      "Marinate beef in soy sauce for 10 minutes.",
      "Heat oil in a wok over high heat and sear beef quickly.",
      "Add garlic and vegetables, stir fry for 3-4 minutes.",
      "Add oyster sauce, toss well, and serve over rice."
    ]
  },
  {
    "id": "m3",
    "title": "Margherita Pizza",
    "category": "Main Course",
    "imageUrl": "https://loremflickr.com/600/400/margherita,pizza",
    "cookTimeMinutes": 40,
    "difficulty": "Hard",
    "servings": 4,
    "calories": 700,
    "description":
        "Classic Neapolitan-style pizza with fresh mozzarella, basil, and tomato sauce.",
    "ingredients": [
      "1 pizza dough ball",
      "1/2 cup tomato sauce",
      "150g fresh mozzarella",
      "Fresh basil leaves",
      "2 tbsp olive oil"
    ],
    "steps": [
      "Preheat oven to the highest setting with a pizza stone.",
      "Roll out the dough into a thin circle.",
      "Spread tomato sauce and top with torn mozzarella.",
      "Bake until crust is charred and cheese bubbles.",
      "Top with fresh basil and drizzle olive oil before serving."
    ]
  },
  {
    "id": "m4",
    "title": "Grilled Salmon with Veggies",
    "category": "Main Course",
    "imageUrl": "https://loremflickr.com/600/400/grilled-salmon,food",
    "cookTimeMinutes": 30,
    "difficulty": "Medium",
    "servings": 2,
    "calories": 520,
    "description":
        "Flaky grilled salmon fillets served with roasted seasonal vegetables.",
    "ingredients": [
      "2 salmon fillets",
      "1 zucchini, sliced",
      "1 cup cherry tomatoes",
      "2 tbsp olive oil",
      "1 lemon",
      "Salt and pepper"
    ],
    "steps": [
      "Preheat oven to 200C (400F).",
      "Toss vegetables in olive oil, salt, and pepper.",
      "Place salmon and vegetables on a baking tray.",
      "Roast for 18-20 minutes until salmon flakes easily.",
      "Squeeze fresh lemon juice over everything before serving."
    ]
  },
  {
    "id": "m5",
    "title": "Vegetable Biryani",
    "category": "Main Course",
    "imageUrl": "https://loremflickr.com/600/400/biryani,food",
    "cookTimeMinutes": 45,
    "difficulty": "Hard",
    "servings": 4,
    "calories": 560,
    "description":
        "Fragrant basmati rice layered with spiced mixed vegetables and fried onions.",
    "ingredients": [
      "2 cups basmati rice",
      "2 cups mixed vegetables",
      "1 cup yogurt",
      "2 onions, thinly sliced and fried",
      "2 tsp biryani masala",
      "Saffron soaked in warm milk"
    ],
    "steps": [
      "Parboil the basmati rice with whole spices.",
      "Cook vegetables with yogurt and biryani masala until tender.",
      "Layer rice and vegetable mixture in a heavy pot.",
      "Top with fried onions and saffron milk.",
      "Cover and cook on low heat (dum) for 20 minutes before serving."
    ]
  },

  // ---------------- DESSERT (5) ----------------
  {
    "id": "d1",
    "title": "Classic Chocolate Brownies",
    "category": "Dessert",
    "imageUrl": "https://loremflickr.com/600/400/brownies,chocolate",
    "cookTimeMinutes": 40,
    "difficulty": "Easy",
    "servings": 9,
    "calories": 310,
    "description": "Rich, fudgy chocolate brownies with a crackly top.",
    "ingredients": [
      "200g dark chocolate",
      "150g butter",
      "3 eggs",
      "1 cup sugar",
      "3/4 cup flour",
      "1/4 cup cocoa powder"
    ],
    "steps": [
      "Melt chocolate and butter together.",
      "Whisk in sugar and eggs until glossy.",
      "Fold in flour and cocoa powder.",
      "Pour into a lined baking pan.",
      "Bake at 180C (350F) for 25-30 minutes and let cool."
    ]
  },
  {
    "id": "d2",
    "title": "New York Cheesecake",
    "category": "Dessert",
    "imageUrl": "https://loremflickr.com/600/400/cheesecake,food",
    "cookTimeMinutes": 75,
    "difficulty": "Hard",
    "servings": 8,
    "calories": 450,
    "description":
        "Creamy baked cheesecake with a buttery graham cracker crust.",
    "ingredients": [
      "2 cups graham cracker crumbs",
      "1/2 cup melted butter",
      "900g cream cheese",
      "1 cup sugar",
      "4 eggs",
      "1 tsp vanilla extract"
    ],
    "steps": [
      "Mix crumbs and butter, press into a springform pan.",
      "Beat cream cheese and sugar until smooth.",
      "Add eggs one at a time, then vanilla.",
      "Pour over crust and bake at 160C (325F) for 55-60 minutes.",
      "Chill for at least 4 hours before serving."
    ]
  },
  {
    "id": "d3",
    "title": "Tiramisu",
    "category": "Dessert",
    "imageUrl": "https://loremflickr.com/600/400/tiramisu,food",
    "cookTimeMinutes": 30,
    "difficulty": "Medium",
    "servings": 6,
    "calories": 400,
    "description":
        "Layers of coffee-soaked ladyfingers and mascarpone cream, dusted with cocoa.",
    "ingredients": [
      "24 ladyfinger biscuits",
      "500g mascarpone cheese",
      "3 eggs, separated",
      "1/2 cup sugar",
      "1 cup strong brewed coffee, cooled",
      "Cocoa powder for dusting"
    ],
    "steps": [
      "Whisk egg yolks and sugar until pale, then fold in mascarpone.",
      "Whip egg whites to soft peaks and fold into the mixture.",
      "Dip ladyfingers briefly in coffee and layer in a dish.",
      "Spread mascarpone mixture over the layer; repeat.",
      "Dust with cocoa and chill for at least 4 hours."
    ]
  },
  {
    "id": "d4",
    "title": "Warm Apple Crumble",
    "category": "Dessert",
    "imageUrl": "https://loremflickr.com/600/400/apple-crumble,food",
    "cookTimeMinutes": 45,
    "difficulty": "Easy",
    "servings": 6,
    "calories": 380,
    "description":
        "Cinnamon-spiced baked apples topped with a crunchy oat crumble.",
    "ingredients": [
      "5 apples, peeled and sliced",
      "1 tsp cinnamon",
      "1 cup rolled oats",
      "1/2 cup flour",
      "1/2 cup brown sugar",
      "1/3 cup cold butter, cubed"
    ],
    "steps": [
      "Toss apple slices with cinnamon and place in a baking dish.",
      "Mix oats, flour, and brown sugar; cut in butter until crumbly.",
      "Sprinkle crumble mixture evenly over apples.",
      "Bake at 190C (375F) for 35-40 minutes until golden.",
      "Serve warm, ideally with vanilla ice cream."
    ]
  },
  {
    "id": "d5",
    "title": "Chocolate Chip Cookies",
    "category": "Dessert",
    "imageUrl": "https://loremflickr.com/600/400/cookies,chocolate",
    "cookTimeMinutes": 25,
    "difficulty": "Easy",
    "servings": 12,
    "calories": 220,
    "description": "Soft-centered cookies loaded with melty chocolate chips.",
    "ingredients": [
      "1 cup butter, softened",
      "3/4 cup brown sugar",
      "3/4 cup white sugar",
      "2 eggs",
      "2 1/4 cups flour",
      "2 cups chocolate chips"
    ],
    "steps": [
      "Cream butter and sugars until fluffy.",
      "Beat in eggs, then gradually mix in flour.",
      "Fold in chocolate chips.",
      "Scoop dough onto a baking tray, spaced apart.",
      "Bake at 190C (375F) for 10-12 minutes until edges are golden."
    ]
  },
];

final List<Recipe> hardcodedRecipes =
    recipesJson.map((json) => Recipe.fromJson(json)).toList();

const List<String> recipeCategories = ["Breakfast", "Main Course", "Dessert"];
