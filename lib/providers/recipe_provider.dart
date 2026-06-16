import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/recipes/data/recipe_data.dart';
import '../features/recipes/data/recipe_model.dart';

final recipesProvider = Provider<List<RecipeModel>>((ref) {
  return recipes;
});