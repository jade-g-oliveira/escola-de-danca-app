import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/dance_classes/presentation/providers/dance_class_provider.dart';
import 'constants/app_assets.dart';
import 'routes/app_routes.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  Future<void> _initializeApp() async {
  try {
    await context.read<DanceClassProvider>().loadDanceClasses();
    await Future.delayed(const Duration(seconds: 1));
  } catch (e) {
    //Envio de erros de conexão para craschlitycs
    debugPrint("Erro ao pré-carregar dados: $e");
  } finally {
      if (mounted) {
        context.go(AppRoutes.home); 
      }
    }
}

@override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    final Color splashBackgroundColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          width: 80,
        ),
      ),
    );
  }
}