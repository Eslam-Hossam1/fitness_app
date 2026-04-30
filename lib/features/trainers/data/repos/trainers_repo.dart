import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/trainer_model.dart';

abstract class TrainersRepo {
  Future<Either<Failure, List<TrainerModel>>> getTrainers();
}
