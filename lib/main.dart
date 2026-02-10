import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_colors.dart';
import 'features/dance_classes/data/datasource/dance_class_remote_datasource.dart';
import 'features/dance_classes/data/repository/dance_class_repository_impl.dart';
import 'features/dance_classes/domain/repositories/dance_class_repository.dart';
import 'features/dance_classes/presentation/providers/dance_class_provider.dart';

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
        Provider<DanceClassRemoteDataSource>(
          create: (_) => DanceClassRemoteDataSourceImpl(dio),
        ),

        Provider<DanceClassRepository>(
          create: (context) => DanceClassRepositoryImpl(
          context.read<DanceClassRemoteDataSource>(),
          ),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().appRouter,
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
    );
  }
}