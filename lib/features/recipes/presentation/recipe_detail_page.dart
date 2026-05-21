import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {

  final String title;
  final String image;
  final String duration;

  const RecipeDetailsPage({
    super.key,
    required this.title,
    required this.image,
    required this.duration,
  });

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
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
                  image,
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
                    title,
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

                      const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 6),

                      Text(duration),

                      const SizedBox(width: 24),

                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),

                      const SizedBox(width: 6),

                      const Text("Facile"),

                    ],
                  ),

                  const SizedBox(height: 30),

                  // Ingrédients
                  const Text(
                    "Ingrédients",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  ingredientItem("2 tomates"),
                  ingredientItem("1 oignon"),
                  ingredientItem("Poulet"),
                  ingredientItem("Huile"),
                  ingredientItem("Sel"),

                  const SizedBox(height: 30),

                  // Préparation
                  const Text(
                    "Préparation",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "1. Couper les légumes.\n\n"
                    "2. Faire chauffer l’huile.\n\n"
                    "3. Ajouter le poulet.\n\n"
                    "4. Cuire pendant 45 minutes.\n\n"
                    "5. Servir chaud.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.7,
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

  Widget ingredientItem(String ingredient) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [

          const Icon(
            Icons.check_circle,
            color: orangePrimary,
            size: 20,
          ),

          const SizedBox(width: 10),

          Text(
            ingredient,
            style: const TextStyle(fontSize: 16),
          ),

        ],
      ),
    );
  }
}