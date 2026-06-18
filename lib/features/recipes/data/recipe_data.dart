import 'recipe_model.dart';

final List<RecipeModel> recipes = [
  RecipeModel(
    title: "Poulet DG",
    image: "assets/images/poulet.jpg",
    description: "Délicieux plat camerounais à base de poulet et plantain.",
    duration: "45 min",
    category: "Plat",
    isFavorite: true,
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
    image: "assets/images/salade.jpg",
    description:"Une salade légère et croquante composée de légumes frais et d'une vinaigrette maison.",
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
    image: "assets/images/pizza.jpg",
    description:"Une pizza généreuse préparée avec une pâte croustillante, du fromage fondant et une sauce tomate parfumée.",
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
    image: "assets/images/burger.jpg",
    description: "Un burger savoureux préparé avec une viande juteuse, du fromage fondant et des légumes frais.",
    duration: "20 min",
    category: "Rapide",
    isFavorite: true,
    ingredients: ["Pain", "Viande", "Fromage", "Laitue", "Tomate", "Oignon"],
    steps: [
      "Préchauffer le gril.",
      "Mettre la viande sur le gril.",
      "Faire cuire les légumes.",
      "Assembler le burger.",
    ],
  ),
];
