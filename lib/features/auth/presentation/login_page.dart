import 'package:flutter/material.dart';
import '../data/auth_service.dart';
import 'signup_page.dart';
import '../../home/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);
  static const Color greySubtitle = Color(0xFF8A8A8A);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(height: 60),

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

                // Password
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

                const SizedBox(height: 14),

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

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final navigator = Navigator.of(context);

                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
                          ),
                        );
                        return;
                      }

                      try {
                        final success = await authService.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );

                        if (!mounted) return;

                        if (success) {
                          navigator.pushReplacement(
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        } else {
                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text("Email ou mot de passe incorrect"),
                            ),
                          );
                        }
                      } catch (e) {
                        if (!mounted) return;

                        messenger.showSnackBar(
                          SnackBar(content: Text("Erreur : $e")),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text("Vous n'avez pas de compte ?"),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupPage()),
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
      ),
    );
  }
}
