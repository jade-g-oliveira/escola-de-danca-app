import 'package:flutter/material.dart';

import 'app_splash_screen.dart';
import 'home_page.dart';

void main() {
  // 1. Garante a inicialização das bindings
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simula o carregamento do Firebase
    await Future.delayed(const Duration(seconds: 2)); 
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escola de Dança',
  theme: ThemeData(
    useMaterial3: true,
    // Define a cor principal e gera tons complementares
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2B12F9),
      primary: const Color(0xFF2B12F9),
    ),
    
    // Customizando o estilo dos campos de texto
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF2B12F9), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Estilo global dos botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2B12F9),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  ),
      home: _isLoading ? const AppSplashScreen() : const HomePage(title: '',),
    );
  }
}

