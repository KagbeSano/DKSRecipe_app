import 'package:flutter/material.dart';
import 'accueil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final List pages = [

    const AccueilPage(),

    const Center(
      child: Text(
        "Recherche",
        style: TextStyle(fontSize: 24),
      ),
    ),

    const Center(
      child: Text(
        "Ajouter une recette",
        style: TextStyle(fontSize: 24),
      ),
    ),

    const Center(
      child: Text(
        "Favoris",
        style: TextStyle(fontSize: 24),
      ),
    ),

    const Center(
      child: Text(
        "Profil",
        style: TextStyle(fontSize: 24),
      ),
    ),

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

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Recherche",
          ),

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