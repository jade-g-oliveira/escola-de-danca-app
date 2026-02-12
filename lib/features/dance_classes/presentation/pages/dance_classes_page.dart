import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home/widgets/empty_state_widget.dart';
import '../../domain/entities/dance_class_entity.dart';
import '../providers/dance_class_provider.dart';
import '../widgets/dance_class_card.dart';

class DanceClassesPage extends StatelessWidget {
  const DanceClassesPage({super.key});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Todos os Ritmos",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Selector<DanceClassProvider, ({bool loading, List<DanceClassEntity> classes})>(
              selector: (context, provider) => (
                loading: provider.loading, 
                classes: provider.danceClasses
              ),
              builder: (context, data, _) {
                if (data.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                if (data.classes.isEmpty) {
                  return EmptyStateWidget(
                    onRetry: () => context.read<DanceClassProvider>().loadDanceClasses(),
                  );
                }

                return ListView.builder(
                  itemCount: data.classes.length,
                  itemBuilder: (context, index) {
                    final danceClass = data.classes[index];
                    return DanceClassCard(
                      rhythm: danceClass.rhythm,
                      onTap: () => context.push(
                        AppRoutes.danceClassDetaill, 
                        extra: danceClass.rhythm,
                      ),
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