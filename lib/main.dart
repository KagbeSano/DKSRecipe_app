import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/auth/presentation/welcome_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fcxkjhxsdpronlgusoor.supabase.co',
    anonKey: 'sb_publishable_ARqdKbr7eLRCsngnTOD3bQ_Qk9LFJCl',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DKSRecipe',
      debugShowCheckedModeBanner: false,
      home:  WelcomePage(),
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
