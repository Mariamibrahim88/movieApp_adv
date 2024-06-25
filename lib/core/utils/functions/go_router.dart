import 'package:go_router/go_router.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/login_view.dart';
import 'package:movie_app_adv/features/Auth/presentation/views/register_view.dart';
import 'package:movie_app_adv/features/home/presentation/views/home_view.dart';
import 'package:movie_app_adv/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/registerView',
      builder: (context, state) => const RegisterView(),
    ),
    // GoRoute(
    //   path: '/registerView',
    //   builder: (context, state) => const RegisterView(),
    // )
  ]);
}
