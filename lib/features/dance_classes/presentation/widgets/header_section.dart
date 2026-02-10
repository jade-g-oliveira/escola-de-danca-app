import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HeaderSection extends StatelessWidget {
  final String nome;
  const HeaderSection({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá, $nome 👋",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pronta para dançar?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ),
      ],
    );
  }
}