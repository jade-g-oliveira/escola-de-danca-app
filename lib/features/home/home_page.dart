import 'package:flutter/material.dart';
import '../dance_classes/presentation/pages/dance_classes_page.dart';
import '../dance_classes/presentation/widgets/custom_bottom_bar.dart';
import 'widgets/home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomeContent(),
      const DanceClassesPage(),
      const Center(child: Text("Agenda em breve")),
      const Center(child: Text("Perfil em breve")),
    ];
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



