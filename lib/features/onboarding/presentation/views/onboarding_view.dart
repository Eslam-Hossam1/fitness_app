import 'package:fitness_app/core/di/service_locator.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/services/storage_services/preferences/preferences_keys.dart';
import 'package:fitness_app/core/services/storage_services/preferences/preferences_service.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  void _finishOnboarding(BuildContext context) async {
    final service = getIt<PreferencesService>();

    await service.setData(
      key: PreferencesKeys.onboardingCompleted,
      value: true,
    );

    if (context.mounted) {
      context.go(RoutePaths.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBackground = Color(0xFF101922);
    const Color primaryBlue = Color(0xFF3F80FF);

    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        backgroundColor: darkBackground,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.clear_outlined, color: Colors.white),
        //   onPressed: () => _finishOnboarding(context),
        // ),
        title: const Text(
          'IronPulse',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                Assets.imagesPngsOnboardingManRunning,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to\nIronPulse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Fuel your progress. Your journey to elite performance starts here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => _finishOnboarding(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
