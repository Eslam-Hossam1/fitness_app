import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/features/trainers/data/models/trainer_model.dart';
import 'package:fitness_app/features/trainers/data/repos/trainers_repo.dart';
import 'trainers_state.dart';

class TrainersCubit extends Cubit<TrainersState> {
  final TrainersRepo _trainersRepo;

  TrainersCubit(this._trainersRepo) : super(const TrainersInitial());

  Future<void> getTrainers() async {
    emit(const TrainersLoading());
    final result = await _trainersRepo.getTrainers();
    result.fold(
      (failure) => emit(TrainersError(failure.errMsg)),
      (trainers) => emit(TrainersLoaded(trainers)),
    );
  }
}
