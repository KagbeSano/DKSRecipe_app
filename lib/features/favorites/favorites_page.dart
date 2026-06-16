import 'package:flutter/material.dart';
import '../recipes/data/recipe_data.dart';
import '../recipes/data/recipe_model.dart';
import '../recipes/presentation/pages/recipe_detail_page.dart';
import '../recipes/presentation/widgets/recipe_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
    // Temporaire
    final List<RecipeModel> favoriteRecipes = recipes.take(2).toList();

    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Mes Favoris ❤️",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: brownTitle,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: favoriteRecipes.isEmpty
                    ? const Center(
                        child: Text(
                          "Aucune recette favorite",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favoriteRecipes.length,

                        itemBuilder: (context, index) {
                          final recipe = favoriteRecipes[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),

                            child: RecipeCard(
                              recipe: recipe,

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        RecipeDetailsPage(
                                          recipe: recipe,
                                        ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}