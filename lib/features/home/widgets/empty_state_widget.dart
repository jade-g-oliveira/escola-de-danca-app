import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const EmptyStateWidget({required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(Icons.music_note_outlined, size: 80, color: Colors.grey[300]), // Ícone que combine com dança
            const SizedBox(height: 16),
            const Text(
              "Nenhum ritmo encontrado",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Não conseguimos carregar as aulas agora.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary),
            ),
            TextButton(
              onPressed: onRetry,
              child: const Text(
                "Tentar novamente",
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}