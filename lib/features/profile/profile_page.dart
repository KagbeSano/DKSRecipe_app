import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/profile.jpg",
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Douaya Sano",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: brownTitle,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "douaya@email.com",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.restaurant_menu),
                  title: const Text("Mes recettes"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Mes favoris"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Paramètres"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangePrimary,
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Déconnexion",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}