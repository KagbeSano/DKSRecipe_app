import 'package:flutter/material.dart';
import '../data/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);
  static const Color greySubtitle = Color(0xFF8A8A8A);

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();//libère la mémoire
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo
              Image.asset('assets/images/logo.png', height: 100),

              const SizedBox(height: 20),

              // Titre
              const Text(
                "Créer un compte",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: brownTitle,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Rejoignez la communauté DKSRecipe.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: greySubtitle),
              ),

              const SizedBox(height: 40),

              // Nom complet
              TextField(
                controller: fullNameController,

                decoration: InputDecoration(
                  hintText: "Nom complet",
                  prefixIcon: const Icon(Icons.person_outline),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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

              // Mot de passe
              TextField(
                controller: passwordController,
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

              const SizedBox(height: 20),

              // Confirmation mot de passe
              TextField(
                controller: confirmPasswordController,
                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Confirmer le mot de passe",
                  prefixIcon: const Icon(Icons.lock_reset_outlined),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Bouton inscription
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () async {

                    final messenger = ScaffoldMessenger.of(context);
                    final navigator = Navigator.of(context);
                    if (fullNameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez remplir tous les champs"),
                        ),
                      );
                      return;
                    }

                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Les mots de passe ne correspondent pas",
                          ),
                        ),
                      );
                      return;
                    }

                    try {
                      final success = await authService.signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (!mounted) return;
                      if (success) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text("Compte créé avec succès"),
                          ),
                        );

                        navigator.pop();
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text("Erreur lors de l'inscription"),
                          ),
                        );
                      }
                    } catch (e) {
                      if (!mounted) return;
                      messenger.showSnackBar(
                        SnackBar(content: Text("Erreur : $e"))
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangePrimary,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    "Créer un compte",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Retour connexion
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Vous avez déjà un compte ?"),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        color: orangePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
