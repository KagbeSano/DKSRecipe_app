import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../../home/presentation/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);
  static const Color greySubtitle = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // Logo
              Image.asset('assets/images/logo.png', height: 110),

              const SizedBox(height: 20),

              // Titre
              const Text(
                "Connexion",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: brownTitle,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Connectez-vous pour accéder à vos recettes.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: greySubtitle),
              ),

              const SizedBox(height: 40),

              // Champ email
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Champ mot de passe
              TextField(
                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  prefixIcon: const Icon(Icons.lock_outline),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Mot de passe oublié
              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(color: orangePrimary),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Bouton connexion
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangePrimary,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    "Se connecter",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Lien inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Vous n'avez pas de compte ?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },

                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                        color: orangePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
