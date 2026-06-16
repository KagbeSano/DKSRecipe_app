import 'package:flutter/material.dart';
import 'accueil_page.dart';
import '../../recipes/presentation/pages/add_recipe_page.dart';
import '../../search/search_page.dart';
import '../../favorites/favorites_page.dart';
import '../../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> pages = [
    const AccueilPage(),
    const SearchPage(),
    const AddRecipePage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: orangePrimary,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Ajouter",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favoris",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
