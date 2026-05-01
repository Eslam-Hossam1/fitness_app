import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/core/errors/supabase_failure.dart';
import 'package:fitness_app/features/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_params.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/features/favorites/data/repos/favorites_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<FavoritePlanModel>>> getFavorites() async {
    try {
      final favoritedPlans = await remoteDataSource.getFavorites();
      return Right(favoritedPlans);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure(e.message));
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite(FavoriteParams params) async {
    try {
      await remoteDataSource.addFavorite(params.planId);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure(e.message));
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(FavoriteParams params) async {
    try {
      await remoteDataSource.removeFavorite(params.planId);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseFailure(e.message));
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
