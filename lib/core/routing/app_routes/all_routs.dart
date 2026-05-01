import 'package:fitness_app/core/routing/app_router.dart';
import 'package:fitness_app/core/routing/app_routes/auth_routes.dart';
import 'package:fitness_app/core/routing/app_routes/onboarding_route.dart';
import 'package:fitness_app/core/routing/app_routes/main_shell_route.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/di/service_locator.dart';
import 'package:fitness_app/core/services/storage_services/preferences/preferences_service.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:fitness_app/features/plans/presentation/views/plan_details_view.dart';
import 'package:fitness_app/features/splash/presentation/screens/custom_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => SplashScreen(
        preferencesService: getIt<PreferencesService>(), 
      ),
    ),
    OnboardingRoute.onboarding,
    MainShellRoute.mainShellRoute,
    ...AuthRoutes.routes,
    GoRoute(
      path: RoutePaths.planDetails,
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: getIt<FavoritesCubit>(),
        child: PlanDetailsView(planId: state.extra as int),
      ),
    ),
  ];
}
