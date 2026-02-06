import 'package:flutter/material.dart';

import 'core/constants/app_assets.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

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