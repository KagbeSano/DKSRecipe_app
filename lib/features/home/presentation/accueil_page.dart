import 'package:flutter/material.dart';
import '../../recipes/data/recipe_model.dart';
import '../../recipes/data/recipe_data.dart';
import '../../recipes/presentation/widgets/recipe_card.dart';
import '../../recipes/presentation/pages/recipe_detail_page.dart';
import '../../recipes/presentation/widgets/category_item.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  String selectedCategory = "Toutes";
  String recipeSearch = "";
  final List<String> categories = [
    "Toutes",
    "Plat",
    "Entrée",
    "Dessert",
    "Boisson",
    "Rapide",
  ];
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      final categoryMatch =
          selectedCategory == "Toutes" || recipe.category == selectedCategory;

      final searchMatch = recipe.title.toLowerCase().contains(
        recipeSearch.toLowerCase(),
      );

      return categoryMatch && searchMatch;
    }).toList();
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Bonjour
            const Text(
              "Bonjour 👋",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 6),

            const Text(
              "Que voulez-vous cuisiner aujourd’hui ?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 24),

            // Barre de recherche
            TextField(
              onChanged: (value) {
                setState(() {
                  recipeSearch = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Rechercher une recette...",

                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Catégories
            const Text(
              "Catégories",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 45,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,

                itemBuilder: (context, index) {
                  String category = categories[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },

                    child: CategoryItem(
                      category: category,
                      isSelected: selectedCategory == category,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Recettes populaires
            const Text(
              "Recettes populaires",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            filteredRecipes.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Aucune recette trouvée",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final RecipeModel recipe = filteredRecipes[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RecipeCard(
                          recipe: recipe,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipeDetailsPage(recipe: recipe),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
