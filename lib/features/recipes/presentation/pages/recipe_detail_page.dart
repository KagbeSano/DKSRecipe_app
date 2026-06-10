import 'package:flutter/material.dart';
import '../../data/recipe_model.dart';
import '../widgets/ingredient_item.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Image recette
            Stack(
              children: [
                Image.asset(
                  recipe.image,
                  width: double.infinity,
                  height: 320,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 45,
                  left: 20,

                  child: CircleAvatar(
                    backgroundColor: Colors.white,

                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),

                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Titre
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: brownTitle,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Infos
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.grey),

                      const SizedBox(width: 6),

                      Text(recipe.duration),

                      const SizedBox(width: 24),

                      const Icon(Icons.star, color: Colors.orange),

                      const SizedBox(width: 6),

                      const Text("Facile"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Ingrédients
                  const Text(
                    "Ingrédients",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients.map((ingredient) {
                      return IngredientItem(ingredient: ingredient);
                    }).toList(),
                  ),
                  const SizedBox(height: 30),

                  // Préparation
                  const Text(
                    "Préparation",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: List.generate(
                      recipe.steps.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),

                        child: Text(
                          "${index + 1}. ${recipe.steps[index]}",
                          style: const TextStyle(fontSize: 16, height: 1.6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
