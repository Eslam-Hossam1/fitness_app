import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/features/auth/presentation/views/login_view.dart';
import 'package:fitness_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => const SignUpView(),
    ),
  ];
}
