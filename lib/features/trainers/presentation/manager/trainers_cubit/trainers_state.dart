import 'package:fitness_app/features/trainers/data/models/trainer_model.dart';

abstract class TrainersState {
  const TrainersState();
}

class TrainersInitial extends TrainersState {
  const TrainersInitial();
}

class TrainersLoading extends TrainersState {
  const TrainersLoading();
}

class TrainersLoaded extends TrainersState {
  final List<TrainerModel> trainers;
  const TrainersLoaded(this.trainers);
}

class TrainersError extends TrainersState {
  final String message;
  const TrainersError(this.message);
}
