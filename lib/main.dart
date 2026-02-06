import 'package:flutter/material.dart';

import 'app_splash_screen.dart';
import 'home_page.dart';
import 'shared/app_colors.dart';

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
colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    surface: AppColors.background,
    error: AppColors.error,
  ),
  scaffoldBackgroundColor: AppColors.background,
    
    // Customizando o estilo dos campos de texto
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // Estilo global dos botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        minimumSize: const Size(double.infinity, 40),
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

