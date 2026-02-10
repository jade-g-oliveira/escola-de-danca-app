import 'package:go_router/go_router.dart';

import '../../app_splash_screen.dart';
import '../../features/home/home_page.dart';
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
    // GoRoute(
    //   path: AppRoutes.danceClassDetaill,
    //   builder: (context, state) {
    //     // Recebendo o ritmo via parâmetro 'extra'
    //     final ritmo = state.extra as String; 
    //     return DanceClassDetailPage(ritmo: ritmo);
    //   },
    // ),
  ],
);
}

