import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/supabase_failure.dart';
import 'package:fitness_app/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/data/repos/featured_plans_repo.dart';

class FeaturedPlansRepoImpl implements FeaturedPlansRepo {
  final HomeRemoteDataSource _remoteDataSource;

  FeaturedPlansRepoImpl(this._remoteDataSource);

  @override
  Future<Either<SupabaseFailure, List<FeaturedPlan>>> getFeaturedPlans() async {
    try {
      final plans = await _remoteDataSource.getFeaturedPlans();
      return Right(plans);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
