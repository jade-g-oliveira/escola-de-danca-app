import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../shared/app_colors.dart';
import '../providers/dance_class_provider.dart';
import '../widgets/dance_class_card.dart';

class DanceClassesPage extends StatelessWidget {
  const DanceClassesPage({super.key});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Todos os Ritmos",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Consumer<DanceClassProvider>(
              builder: (context, provider, _) {
                if (provider.loading) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                }
                
                final allClasses = provider.danceClasses;

                return ListView.builder(
                  itemCount: allClasses.length,
                  itemBuilder: (context, index) {
                    final danceClass = allClasses[index];
                    return DanceClassCard(
                      ritmo: allClasses[index].rhythm,
                      onTap: () => context.push(AppRoutes.danceClassDetaill, extra: danceClass.rhythm),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}