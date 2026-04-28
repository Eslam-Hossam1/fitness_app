import 'package:fitness_app/core/services/storage_services/preferences/preferences_keys.dart';
import 'package:fitness_app/core/services/storage_services/preferences/preferences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final PreferencesService preferencesService;

  SplashCubit(this.preferencesService) : super(SplashInitial()) {
     print("🐣 SplashCubit created"); 
  }

  void checkStatus() async {
    print("🕒 SplashCubit checkStatus() started. Waiting 3 seconds...");
    await Future.delayed(const Duration(seconds: 3));
    print("⏳ 3 seconds passed.");

    print("🔍 Checking preferences for Onboarding status...");
    final bool hasCompletedOnboarding = 
        preferencesService.getBool(key: PreferencesKeys.onboardingCompleted) ?? false;
    print("📋 Onboarding completed: $hasCompletedOnboarding");

    if (!hasCompletedOnboarding) {
      print("📝 Setting Onboarding as completed in preferences...");
      await preferencesService.setData(key: PreferencesKeys.onboardingCompleted, value: true);
      
      print("🚀 Emitting SplashNavigateToOnBoarding...");
      emit(SplashNavigateToOnBoarding());
    } else {
      print("🔍 Checking Supabase session...");
      final session = Supabase.instance.client.auth.currentSession;
      print("👤 Supabase session: $session");

      if (session != null) {
        print("🚀 Emitting SplashNavigateToHome...");
        emit(SplashNavigateToHome());
      } else {
        print("🚀 Emitting SplashNavigateToLogin...");
        emit(SplashNavigateToLogin());
      }
    }
  }
}