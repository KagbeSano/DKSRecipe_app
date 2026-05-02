import 'package:dksrecipe_app/features/auth/data/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
    const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();

  Future<void> signUp() async {
    final success = await authService.signUp(
      emailController.text,
      passwordController.text,
    );
    if (!mounted) return;
    if (success){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: 
        Text ('compte crée avec succès')),
      );
    }else {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: 
        Text ("Erreur lors de l'inscription")),
      );
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText:'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText:'Mot de passe '),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: Text('S\'inscrire')
              ),
          ],
        ),
        ),
    );
  }
}
