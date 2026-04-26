import 'package:fitness_app/core/routing/app_router.dart';
import 'package:fitness_app/core/routing/app_routes/auth_routes.dart';
import 'package:fitness_app/core/routing/app_routes/onboarding_route.dart';
import 'package:fitness_app/core/routing/app_routes/main_shell_route.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/features/plans/presentation/views/plan_details_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    OnboardingRoute.onboarding,
    MainShellRoute.mainShellRoute,
    ...AuthRoutes.routes,
    GoRoute(
      path: RoutePaths.planDetails,
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      builder: (context, state) => PlanDetailsView(planId: state.extra as int),
    ),
  ];
}
