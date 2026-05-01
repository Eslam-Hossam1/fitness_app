import 'package:fitness_app/features/onboarding/presentation/views/onboarding_view.dart';

import '../routes_paths.dart';
import 'package:go_router/go_router.dart';

class OnboardingRoute {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) => const OnboardingView(),
  );

}
