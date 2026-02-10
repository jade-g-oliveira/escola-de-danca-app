import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../shared/app_colors.dart';
import '../../dance_classes/presentation/providers/dance_class_provider.dart';
import '../../dance_classes/presentation/widgets/dance_class_card.dart';
import '../../dance_classes/presentation/widgets/header_section.dart';
import '../../dance_classes/presentation/widgets/search_bar_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(nome: "Jade"),
              const SizedBox(height: 24),
              const SearchBarWidget(),
              const SizedBox(height: 32),
              const Text(
                "Aulas em destaque",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer<DanceClassProvider>(
                  builder: (context, provider, _) {
                    if (provider.loading && provider.danceClasses.isEmpty) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                    }

                    final danceClasses = provider.danceClasses.take(5).toList();

                    return ListView.builder(
                      itemCount: danceClasses.length,
                      itemBuilder: (context, index) {
                        final danceClass = danceClasses[index];
                        return DanceClassCard(
                          ritmo: danceClasses[index].rhythm,
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