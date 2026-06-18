import 'package:flutter/material.dart';
import '../../data/recipe_model.dart';
import '../widgets/ingredient_item.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsPage({
    super.key,
    required this.recipe,
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
            // IMAGE
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
                      onPressed: () => Navigator.pop(context),
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
                  // TITRE
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: brownTitle,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // DESCRIPTION
                  Text(
                    recipe.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // INFOS
                  Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,

                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: orangePrimary,
                            ),
                            SizedBox(height: 5),
                            Text(recipe.duration),
                          ],
                        ),

                        Column(
                          children: [
                            Icon(
                              Icons.restaurant,
                              color: orangePrimary,
                            ),
                            SizedBox(height: 5),
                            Text(recipe.category),
                          ],
                        ),

                        Column(
                          children: [
                            Icon(
                              Icons.star,
                              color: orangePrimary,
                            ),
                            SizedBox(height: 5),
                            Text("Easy"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // INGREDIENTS
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: recipe.ingredients.map(
                      (ingredient) {
                        return IngredientItem(
                          ingredient: ingredient,
                        );
                      },
                    ).toList(),
                  ),

                  const SizedBox(height: 30),

                  // PREPARATION
                  const Text(
                    "Preparation",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Column(
                    children: List.generate(
                      recipe.steps.length,
                      (index) {
                        return Container(
                          margin:
                              const EdgeInsets.only(bottom: 15),

                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(16),
                          ),

                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    orangePrimary,
                                radius: 14,

                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  recipe.steps[index],
                                  style:
                                      const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}