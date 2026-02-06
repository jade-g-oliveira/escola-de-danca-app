import 'package:flutter/material.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color splashBackgroundColor = Color(0xFF2B12F9);
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/images/app_logo.jpeg',
          width: 200,
        ),
      ),
    );
  }
}