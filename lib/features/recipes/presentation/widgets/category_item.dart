import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;

  const CategoryItem({
    super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18),

      decoration: BoxDecoration(
        color: const Color(0xFFE8903A),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
