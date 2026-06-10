import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String ingredient;

  const IngredientItem({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFFE8903A),
            size: 20,
          ),

          const SizedBox(width: 10),

          Text(
            ingredient,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}