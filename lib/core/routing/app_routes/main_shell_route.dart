import 'package:fitness_app/features/plans/presentation/views/plans_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/features/main/presentation/views/main_view.dart';
import 'package:fitness_app/features/home/presentation/views/home_view.dart';
import 'package:fitness_app/core/widgets/custom_screen_placeholder.dart';
import 'package:fitness_app/features/home/presentation/manager/featured_plans_cubit/featured_plans_cubit.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:fitness_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:fitness_app/core/di/service_locator.dart';
import 'package:fitness_app/features/home/data/repos/featured_plans_repo.dart';

class MainShellRoute {
  static final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeNav');
  static final GlobalKey<NavigatorState> _trainersNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'trainersNav');
  static final GlobalKey<NavigatorState> _plansNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'plansNav');
  static final GlobalKey<NavigatorState> _favoritesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'favNav');
  static final GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profileNav');

  static StatefulShellRoute mainShellRoute = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return BlocProvider.value(
        value: getIt<FavoritesCubit>()..getFavorites(),
        child: MainView(navigationShell: navigationShell),
      );
    },
    branches: [
      StatefulShellBranch(
        navigatorKey: _homeNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.home,
            builder: (context, state) => BlocProvider(
              create: (context) => FeaturedPlansCubit(getIt<FeaturedPlansRepo>())..getFeaturedPlans(),
              child: const HomeView(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _trainersNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.trainers,
            builder: (context, state) => const CustomScreenPlaceholder(text: 'Trainers Screen'),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _plansNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.plans,
            builder: (context, state) => PlansView(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _favoritesNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.favorites,
            builder: (context, state) => const FavoritesView(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _profileNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.profile,
            builder: (context, state) => const CustomScreenPlaceholder(text: 'Profile Screen'),
          ),
        ],
      ),
    ],
  );
}
