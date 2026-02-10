import 'package:go_router/go_router.dart';

import '../../features/dance_classes/presentation/pages/dance_class_detail_page.dart';
import '../../features/home/home_page.dart';
import '../app_splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  final appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const AppSplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.danceClassDetaill,
      builder: (context, state) {
        final rhythm = (state.extra as String?) ?? 'Ritmo não encontrado';
        return DanceClassDetailPage(rhythm: rhythm);
      },
    ),
  ],
);
}

