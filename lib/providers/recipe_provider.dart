import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/recipes/data/recipe_model.dart';
import '../features/recipes/data/recipe_data.dart';

class RecipeNotifier extends StateNotifier<List<RecipeModel>> {
  RecipeNotifier() : super(recipes);

  void addRecipe(RecipeModel recipe) {
    state = [...state, recipe];
  }
}

final recipesProvider =
    StateNotifierProvider<RecipeNotifier, List<RecipeModel>>(
  (ref) => RecipeNotifier(),
);