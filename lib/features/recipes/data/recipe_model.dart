class RecipeModel {
  final String title;
  final String image;
  final String duration;
  final String category;
  final List<String> ingredients;
  final List<String> steps;

  RecipeModel({
    required this.title,
    required this.image,
    required this.duration,
    required this.category,
    required this.ingredients,
    required this.steps,
  });
}
