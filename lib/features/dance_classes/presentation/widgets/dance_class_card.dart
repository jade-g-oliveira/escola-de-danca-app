import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';

class DanceClassCard extends StatelessWidget {
  final String ritmo;
  final VoidCallback onTap;

  const DanceClassCard({
    super.key,
    required this.ritmo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.music_note, color: AppColors.primary),
        ),
        title: Text(
          ritmo.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: const Text("Escola de Dança • 60 min"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
        onTap: onTap,
      ),
    );
  }
}