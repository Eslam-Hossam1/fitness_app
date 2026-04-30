import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/services/storage_services/preferences/preferences_service.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:fitness_app/features/splash/presentation/cubit/splash_state.dart';
import 'package:fitness_app/features/splash/presentation/screens/widgets/splash_image.dart';
import 'package:fitness_app/features/splash/presentation/screens/widgets/splash_logo_widget.dart';
import 'package:fitness_app/features/splash/presentation/screens/widgets/splash_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  final PreferencesService preferencesService;

  const SplashScreen({super.key, required this.preferencesService});

  @override
  Widget build(BuildContext context) {
    print("🏗️ 8. SplashScreen build method started");

    return BlocProvider(
      lazy: false,
      create: (context) {
        print("🛠️ 9. BlocProvider create started. Removing Native Splash...");
        FlutterNativeSplash.remove();
        print("✅ 10. Native Splash removed. Creating SplashCubit...");
        return SplashCubit(preferencesService)..checkStatus();
      },
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          print("📡 11. BlocListener received state: $state");

          if (state is SplashNavigateToOnBoarding) {
            print("➡️ 12. Navigating to /onboarding");
            context.go(RoutePaths.onboarding);
          } else if (state is SplashNavigateToHome) {
            print("➡️ 12. Navigating to /home");
            context.go(RoutePaths.home);
          } else if (state is SplashNavigateToLogin) {
            print("➡️ 12. Navigating to /login");
            context.go(RoutePaths.login);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.darkScaffoldBackground,
          body: Stack(
            children: [
              SplashImage(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF17212E),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.darkPrimary.withValues(
                                    alpha: 0.15,
                                  ),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.fitness_center,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                      SplashLogoWidget(),
                      SizedBox(height: 50),
                      SplashProgressBar(),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
