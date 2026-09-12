class Recipe {
  final String id;
  final String title;
  final String category; // Breakfast, Main Course, Dessert
  final String imageUrl;
  final int cookTimeMinutes;
  final String difficulty; // Easy, Medium, Hard
  final int servings;
  final int calories;
  final List<String> ingredients;
  final List<String> steps;
  final String description;

  const Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.cookTimeMinutes,
    required this.difficulty,
    required this.servings,
    required this.calories,
    required this.ingredients,
    required this.steps,
    required this.description,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      cookTimeMinutes: json['cookTimeMinutes'] as int,
      difficulty: json['difficulty'] as String,
      servings: json['servings'] as int,
      calories: json['calories'] as int,
      ingredients: List<String>.from(json['ingredients'] as List),
      steps: List<String>.from(json['steps'] as List),
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'imageUrl': imageUrl,
      'cookTimeMinutes': cookTimeMinutes,
      'difficulty': difficulty,
      'servings': servings,
      'calories': calories,
      'ingredients': ingredients,
      'steps': steps,
      'description': description,
    };
  }
}
