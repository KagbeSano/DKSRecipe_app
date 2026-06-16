import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final durationController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      appBar: AppBar(
        backgroundColor: backgroundBeige,
        elevation: 0,
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
            // Image
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
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Titre
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

            // Description
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

            // Catégorie
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

            // Durée
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

                onPressed: () {},

                child: const Text(
                  "Enregistrer",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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