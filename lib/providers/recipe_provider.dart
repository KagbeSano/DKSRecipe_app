import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/recipes/data/recipe_model.dart';
import '../features/recipes/data/recipe_data.dart';

class RecipeNotifier extends StateNotifier<List<RecipeModel>> {
  RecipeNotifier() : super(recipes);

  void addRecipe(RecipeModel recipe) {
    state = [...state, recipe];
  }

  void toggleFavorite(String title) {
    state = state.map((recipe) {
      if (recipe.title == title) {
        return RecipeModel(
          title: recipe.title,
          description: recipe.description,
          image: recipe.image,
          duration: recipe.duration,
          category: recipe.category,
          ingredients: recipe.ingredients,
          steps: recipe.steps,
          isFavorite: !recipe.isFavorite,
        );
      }
      return recipe;
    }).toList();
  }
}

final recipesProvider =
    StateNotifierProvider<RecipeNotifier, List<RecipeModel>>(
  (ref) => RecipeNotifier(),
);