import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importe suas camadas de Clean Arch aqui
import 'app_splash_screen.dart';
import 'features/dance_classes/data/repository/dance_class_repository_impl.dart';
import 'features/dance_classes/domain/repositories/dance_class_repository.dart';
import 'features/dance_classes/presentation/providers/dance_class_provider.dart';
import 'features/home/home_page.dart';
import 'shared/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5),
    headers: {
    'User-Agent': 'PostmanRuntime/7.32.3', //para evitar o 403
    'Accept': '*/*',
  },
  ));

  runApp(
    MultiProvider(
      providers: [
        Provider<DanceClassRepository>(
          create: (_) => DanceClassRepositoryImpl(dio),
        ),

        ChangeNotifierProvider(
          create: (context) => DanceClassProvider(
            context.read<DanceClassRepository>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

Future<void> _initializeApp() async {
  try {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<DanceClassProvider>().fetchAulas();
  });
  } catch (e) {
    //Envio de erros de conexão para craschlitycs
    debugPrint("Erro ao pré-carregar dados: $e");
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false; //Só libera a Home aqui
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escola de Dança',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.background,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.background,
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      home: _isLoading ? const AppSplashScreen() : const HomeScreen(),
    );
  }
}