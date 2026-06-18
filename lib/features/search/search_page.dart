import 'package:flutter/material.dart';
import '../recipes/data/recipe_data.dart';
import '../recipes/data/recipe_model.dart';
import '../recipes/presentation/pages/recipe_detail_page.dart';
import '../recipes/presentation/widgets/recipe_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = "";

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Recherche",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: brownTitle,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
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
              const SizedBox(height: 20),

              Text(
                "${filteredRecipes.length} résultat(s)",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: filteredRecipes.isEmpty
                    ? const Center(child: Text("Aucune recette trouvée"))
                    : ListView.builder(
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
                                    builder: (_) =>
                                        RecipeDetailsPage(recipe: recipe),
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
