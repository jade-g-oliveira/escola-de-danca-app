import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class DanceClassDetailPage extends StatelessWidget {
  final String rhythm;

  const DanceClassDetailPage({required this.rhythm, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                ),
                child: const Icon(Icons.music_note, size: 80, color: Colors.white24),
              ),
              SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.surface),
                  onPressed: () => context.pop(),
                ),
              ),
            ],
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rhythm.toUpperCase(),
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoChip(Icons.timer_outlined, "60 min"),
                      _buildInfoChip(Icons.trending_up, "Iniciante"),
                      _buildInfoChip(Icons.person_outline, "Prof. Carlos"),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  const Text(
                    "Sobre a aula",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Uma aula envolvente de $rhythm focada na expressão corporal e ritmo. "
                    "Perfeito para quem quer começar do zero e se divertir!",
                    style: TextStyle(color: Colors.blueGrey[600], height: 1.5),
                  ),
                  
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mensalidade", style: TextStyle(fontSize: 12)),
                          Text("R\$ 150,00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Reservar Vaga"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary..withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}