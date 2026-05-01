import 'package:fitness_app/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:fitness_app/features/favorites/data/repos/favorites_repository_impl.dart';
import 'package:fitness_app/features/favorites/data/repos/favorites_repository.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:fitness_app/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:fitness_app/features/home/data/datasources/home_remote_data_source/home_remote_data_source_impl.dart';
import 'package:fitness_app/features/home/data/repos/featured_plans_repo.dart';
import 'package:fitness_app/features/home/data/repos/featured_plans_repo_impl.dart';
import 'package:fitness_app/features/profile/profile_controller.dart';
import 'package:fitness_app/features/profile/profile_service.dart';
import 'package:fitness_app/features/trainers/data/datasources/trainers_remote_data_source.dart';
import 'package:fitness_app/features/trainers/data/repos/trainers_repo.dart';
import 'package:fitness_app/features/trainers/data/repos/trainers_repo_impl.dart';
import 'package:fitness_app/features/trainers/presentation/manager/trainers_cubit/trainers_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/storage_services/preferences/preferences_service.dart';
import '../services/storage_services/secure_storage/secure_storage_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _setupCaching();
  _setupHome();
  _setupFavorites();
  _setupProfile();
  _setupTrainers();
}

void _setupHome() {
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<FeaturedPlansRepo>(
    () => FeaturedPlansRepoImpl(getIt<HomeRemoteDataSource>()),
  );
}

void _setupFavorites() {
  final supabaseClient = Supabase.instance.client;

  // Data Sources
  getIt.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(supabaseClient),
  );

  // Repositories
  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(getIt<FavoritesRemoteDataSource>()),
  );

  // Cubits
  getIt.registerLazySingleton(
    () => FavoritesCubit(getIt<FavoritesRepository>()),
  );
}

void _setupProfile() {
  // Services
  getIt.registerSingleton<ProfileService>(ProfileService());

  // Controllers
  getIt.registerSingleton<ProfileController>(
    ProfileController(getIt<ProfileService>()),
  );
}

void _setupTrainers() {
  final supabaseClient = Supabase.instance.client;

  // Data Sources
  getIt.registerLazySingleton<TrainersRemoteDataSource>(
    () => TrainersRemoteDataSourceImpl(supabaseClient),
  );

  // Repositories
  getIt.registerLazySingleton<TrainersRepo>(
    () => TrainersRepoImpl(getIt<TrainersRemoteDataSource>()),
  );

  // Cubits
  getIt.registerFactory<TrainersCubit>(
    () => TrainersCubit(getIt<TrainersRepo>()),
  );
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
