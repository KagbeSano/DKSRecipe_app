import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/recipe_provider.dart';
import '../../data/recipe_model.dart';

class AddRecipePage extends ConsumerStatefulWidget {
  const AddRecipePage({super.key});

  @override
  ConsumerState<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends ConsumerState<AddRecipePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final durationController = TextEditingController();
  final ingredientsController = TextEditingController();
  final stepsController = TextEditingController();

  String selectedCategory = "Plat";

  final List<String> categories = [
    "Plat",
    "Entrée",
    "Dessert",
    "Rapide",
  ];

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    durationController.dispose();  //libère la mémoire 
    ingredientsController.dispose();
    stepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,
      appBar: AppBar(
        backgroundColor: backgroundBeige,
        centerTitle: true,
        title: const Text(
          "Ajouter une recette",
          style: TextStyle(
            color: brownTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ajouter une photo",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Titre",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Nom de la recette",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Décrivez votre recette",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Catégorie",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Durée (minutes)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Ex : 30",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Ingrédients",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: ingredientsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Tomates, Oignons, Riz, Poulet...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Étapes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brownTitle,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: stepsController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Une étape par ligne",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      descriptionController.text.isEmpty ||
                      durationController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Veuillez remplir tous les champs",
                        ),
                      ),
                    );
                    return;
                  }

                  final recipe = RecipeModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    image: "assets/images/poulet.jpg",
                    duration: "${durationController.text} min",
                    category: selectedCategory,
                    ingredients: ingredientsController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList(),
                    steps: stepsController.text
                        .split('\n')
                        .map((e) => e.trim())
                        .toList(),
                  );

                  ref
                      .read(recipesProvider.notifier)
                      .addRecipe(recipe);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Recette ajoutée avec succès",
                      ),
                    ),
                  );

                  titleController.clear();
                  descriptionController.clear();
                  durationController.clear();
                  ingredientsController.clear();
                  stepsController.clear();
                },
                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}