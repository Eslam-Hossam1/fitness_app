import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/storage_services/preferences/preferences_service.dart';
import '../services/storage_services/secure_storage/secure_storage_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _setupCaching();
}

Future<void> _setupCaching() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<PreferencesService>(
    PreferencesService(sharedPreferences),
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions();

  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());

  getIt.registerSingleton<SecureStorageService>(
    SecureStorageService(secureStorage),
  );
}
