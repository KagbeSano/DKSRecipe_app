import 'package:flutter/material.dart';
import '../../recipes/data/recipe_model.dart';
import '../../recipes/data/recipe_data.dart';
import '../../recipes/presentation/recipe_detail_page.dart';


class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
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

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  categoryItem("Africain"),
                  categoryItem("Dessert"),
                  categoryItem("Vegan"),
                  categoryItem("Boisson"),
                  categoryItem("Rapide"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Recettes populaires
            const Text(
              "Recettes populaires",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: recipes.length,

              itemBuilder: (context, index) {
                final RecipeModel recipe = recipes[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),

                  child: recipeCard(
                    context: context,
                    image: recipe.image,
                    title: recipe.title,
                    duration: recipe.duration,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget catégorie
  Widget categoryItem(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18),

      decoration: BoxDecoration(
        color: orangePrimary,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Widget recette
  Widget recipeCard({
    required BuildContext context,
    required String image,
    required String title,
    required String duration,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsPage(
              title: title,
              image: image,
              duration: duration,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),

            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.access_time, size: 18, color: Colors.grey),

                    const SizedBox(width: 6),

                    Text(duration, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
