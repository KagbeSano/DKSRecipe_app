import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color backgroundBeige = Color(0xFFF5EFE6);
  static const Color orangePrimary = Color(0xFFE8903A);
  static const Color brownTitle = Color(0xFF4A2C0A);
  static const Color greySubtitle = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBeige,

      body: Column(
        children: [
          Expanded(
            flex: 3, // prend 30 % de la hauteur
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 90),

                    const SizedBox(height: 12),

                    const Text(
                      'DKSRecipe',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: brownTitle,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Découvrez, cuisinez\net partagez vos meilleures recettes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: greySubtitle,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/food.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 60,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [backgroundBeige, Colors.transparent],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 60,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [backgroundBeige, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
            child: Column(
              children: [
                _BoutonPrincipal(
                  texte: 'Se connecter',
                  icone: Icons.restaurant,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                _BoutonSecondaire(
                  texte: 'Créer un compte',
                  icone: Icons.person_add_outlined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                const Text(
                  'Rejoignez la communauté des passionnés de cuisine !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: greySubtitle),
                ),

                const SizedBox(height: 8),

                const Icon(
                  Icons.favorite_border,
                  color: orangePrimary,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BoutonPrincipal extends StatelessWidget {
  final String texte;
  final IconData icone;
  final VoidCallback onPressed;

  const _BoutonPrincipal({
    required this.texte,
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icone, color: Colors.white, size: 22),
        label: Text(
          texte,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: WelcomePage.orangePrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // bord arrondi (pill)
          ),
        ),
      ),
    );
  }
}

class _BoutonSecondaire extends StatelessWidget {
  final String texte;
  final IconData icone;
  final VoidCallback onPressed;

  const _BoutonSecondaire({
    required this.texte,
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icone, color: WelcomePage.orangePrimary, size: 22),
        label: Text(
          texte,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: WelcomePage.orangePrimary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: WelcomePage.orangePrimary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
