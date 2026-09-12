import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/recipes_data.dart';
import '../models/recipe.dart';
import '../services/recipes_controller.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _servingsController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();

  String _category = recipeCategories.first;
  String _difficulty = 'Easy';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _cookTimeController.dispose();
    _servingsController.dispose();
    _caloriesController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final newRecipe = Recipe(
      id: 'custom-${DateTime.now().millisecondsSinceEpoch}',
      title: _titleController.text.trim(),
      category: _category,
      imageUrl: _imageUrlController.text.trim().isEmpty
          ? 'https://picsum.photos/seed/${_titleController.text.trim()}/600/400'
          : _imageUrlController.text.trim(),
      cookTimeMinutes: int.parse(_cookTimeController.text.trim()),
      difficulty: _difficulty,
      servings: int.parse(_servingsController.text.trim()),
      calories: int.tryParse(_caloriesController.text.trim()) ?? 0,
      description: _descriptionController.text.trim(),
      ingredients: _ingredientsController.text
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      steps: _stepsController.text
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
    );

    context.read<RecipesController>().addRecipe(newRecipe);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"${newRecipe.title}" added to CookMate!')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit a Recipe')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Recipe Title'),
              validator: (value) => (value == null || value.trim().length < 3)
                  ? 'Title must be at least 3 characters'
                  : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: recipeCategories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) => setState(() => _category = value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _difficulty,
              decoration: const InputDecoration(labelText: 'Difficulty'),
              items: const ['Easy', 'Medium', 'Hard']
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (value) => setState(() => _difficulty = value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Short Description'),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Please add a short description'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL (optional)',
                hintText: 'Leave blank to auto-generate a placeholder',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cookTimeController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Cook Time (min)'),
                    validator: (value) {
                      final n = int.tryParse(value ?? '');
                      if (n == null || n <= 0) return 'Enter valid minutes';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _servingsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Servings'),
                    validator: (value) {
                      final n = int.tryParse(value ?? '');
                      if (n == null || n <= 0) return 'Enter valid number';
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _caloriesController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Calories (optional)'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ingredientsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Ingredients (one per line)',
              ),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Add at least one ingredient'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _stepsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Steps (one per line)',
              ),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Add at least one step'
                  : null,
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: _submit,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text('Submit Recipe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
