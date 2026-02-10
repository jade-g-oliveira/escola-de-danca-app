import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Procurar aulas, estilos ou professores...",
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              );
  }
}