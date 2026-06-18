class RecipeModel {
  final String title;
  final String description;
  final String image;
  final String duration;
  final String category;
  final List<String> ingredients;
  final List<String> steps;
  final bool isFavorite;

  RecipeModel({
    required this.title,
    required this.description,
    required this.image,
    required this.duration,
    required this.category,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });
}