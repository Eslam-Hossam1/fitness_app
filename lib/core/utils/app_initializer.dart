import 'package:fitness_app/core/config/env_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:fitness_app/core/di/service_locator.dart';
import 'package:fitness_app/core/utils/app_bloc_observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppInitializer {
  static Future<void> initialize() async {
    print("⚙️ AppInitializer: Starting initialization process...");

    print("⏳ AppInitializer: Loading .env file...");
    await _setupDotEnv();
    print("✅ AppInitializer: .env loaded successfully.");

    print("⏳ AppInitializer: Setting up Supabase...");
    await setupSupaBase();
    print("✅ AppInitializer: Supabase setup complete.");

    print("⏳ AppInitializer: Initializing BlocObserver and HydratedBloc...");
    await _initBlocObserverAndHydratedBloc();
    print("✅ AppInitializer: BlocObserver and HydratedBloc initialized.");

    print("⏳ AppInitializer: Initializing Service Locator (DI)...");
    await _initServiceLocator();
    print("✅ AppInitializer: Service Locator initialized.");

    print("🎉 AppInitializer: All initializations completed successfully!");
  }

  static Future<void> setupSupaBase() async {
    print("   -> Supabase: calling Supabase.initialize...");
    await Supabase.initialize(
      url: EnvHelper.supabaseUrl,
      anonKey: EnvHelper.supabaseAnonKey,
    );
    print("   -> Supabase: initialized.");
  }

  static Future<void> _setupDotEnv() async {
    print("   -> DotEnv: calling dotenv.load...");
    await dotenv.load(fileName: ".env");
    print("   -> DotEnv: loaded.");
  }

  static Future<void> _initServiceLocator() async {
    print("   -> ServiceLocator: calling setupServiceLocator...");
    await setupServiceLocator();
    print("   -> ServiceLocator: setup complete.");
  }

  static Future<void> _initBlocObserverAndHydratedBloc() async {
    print("   -> Bloc: Setting Bloc.observer...");
    Bloc.observer = AppBlocObserver();
    
    print("   -> HydratedBloc: Building HydratedStorage...");
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
    print("   -> HydratedBloc: Storage built.");
  }
}
