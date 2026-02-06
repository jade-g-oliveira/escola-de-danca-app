import 'package:flutter/material.dart';

abstract class AppColors {
  // Cor Principal (Escola de Dança)
  static const Color primary = Color(0xFF2B12F9);
  
  // Tons de Apoio
  static const Color background = Color(0xFFF8F9FF); // Um branco levemente azulado
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE53935);

  // Cores de Texto
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);

  // Exemplo de Gradiente 
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2B12F9),
      Color(0xFF6351FF), // Um tom mais claro para o degrade
    ],
  );
}