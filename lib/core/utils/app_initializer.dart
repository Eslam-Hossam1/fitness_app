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
    await _setupDotEnv();
    await _initBlocObserverAndHydratedBloc();
    await _initServiceLocator();
  }

  static Future<void> setupSupaBase() async {
    await Supabase.initialize(
      url: EnvHelper.supabaseUrl,
      anonKey: EnvHelper.supabaseAnonKey,
    );
  }

  static Future<void> _setupDotEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
  }

  static Future<void> _initBlocObserverAndHydratedBloc() async {
    Bloc.observer = AppBlocObserver();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }
}
