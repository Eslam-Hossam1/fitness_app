import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/supabase_failure.dart';
import '../models/trainer_model.dart';
import 'trainers_repo.dart';
import '../datasources/trainers_remote_data_source.dart';

class TrainersRepoImpl implements TrainersRepo {
  final TrainersRemoteDataSource _remoteDataSource;

  TrainersRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<TrainerModel>>> getTrainers() async {
    try {
      final trainers = await _remoteDataSource.getTrainers();
      return Right(trainers);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
