import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_params.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<FavoritePlanModel>>> getFavorites();
  Future<Either<Failure, void>> addFavorite(FavoriteParams params);
  Future<Either<Failure, void>> removeFavorite(FavoriteParams params);
}
