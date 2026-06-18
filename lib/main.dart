import 'package:flutter/material.dart';
import 'features/auth/presentation/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() async {

   runApp(
    const ProviderScope(
      child: MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DKSRecipe',
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DKSRecipe'), centerTitle: true),
      body: Center(
        child: Text(
          'Bienvenue dans DKSRecipe 🍲',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
