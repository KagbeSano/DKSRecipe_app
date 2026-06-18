import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRecipesProvider =
    StateProvider<List<String>>((ref) => []);