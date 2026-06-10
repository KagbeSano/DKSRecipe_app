import 'recipe_model.dart';

final List<RecipeModel> recipes = [
  RecipeModel(
    title: "Poulet DG",
    image: "assets/images/food.png",
    duration: "45 min",
    category: "Plat",
    ingredients: ["Poulet", "Plantain", "Oignons", "Huile", "Sel"],

    steps: [
      "Découper le poulet.",
      "Faire frire les plantains.",
      "Préparer les légumes.",
      "Ajouter le poulet.",
      "Laisser cuire 45 minutes.",
    ],
  ),

  RecipeModel(
    title: "Salade fraîche",
    image: "assets/images/food.png",
    duration: "15 min",
    category: "Entrée",
    ingredients: ["Laitue", "Tomates", "Oignons", "Vinaigre", "Huile"],
    steps: [
      "Laver les légumes.",
      "Couper les tomates en dés.",
      "Mélanger les ingrédients.",
      "Assaisonner à la vinaigrette.",
    ],
  ),

  RecipeModel(
    title: "Pizza maison",
    image: "assets/images/food.png",
    duration: "30 min",
    category: "Rapide",
    ingredients: ["Pâte à pizza", "Tomates", "Fromage", "Jambon"],

    steps: [
      "Étaler la pâte.",
      "Ajouter la sauce tomate.",
      "Ajouter le fromage.",
      "Cuire au four.",
    ],
  ),

  RecipeModel(
    title: "Burger gourmet",
    image: "assets/images/food.png",
    duration: "20 min",
    category: "Rapide",
    ingredients: ["Pain", "Viande", "Fromage", "Laitue", "Tomate", "Oignon"],
    steps: [
      "Préchauffer le gril.",
      "Mettre la viande sur le gril.",
      "Faire cuire les légumes.",
      "Assembler le burger.",
    ],
  ),
];
