import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dance_classes/presentation/pages/dance_classes_page.dart';
import '../dance_classes/presentation/providers/dance_class_provider.dart';
import '../dance_classes/presentation/widgets/custom_bottom_bar.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomeContent(), // Extraia o conteúdo atual da sua Home para um widget
      const DanceClassesPage(),
      const Center(child: Text("Agenda em breve")),
      const Center(child: Text("Perfil em breve")),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DanceClassProvider>().fetchAulas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),      
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}



