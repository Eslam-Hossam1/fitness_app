import 'package:fitness_app/features/plans/data/models/plans_model.dart';
import 'package:fitness_app/features/plans/data/repos/plans_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this.repo) : super(PlansInitial());

  final PlansRepo repo;

  Future<void> getPlans() async {
    emit(PlansLoading());

    try {
      final plans = await repo.getPlans();
      emit(PlansSuccess(plans: plans));
    } catch (errorMessage) {
      emit(PlansFailure(errorMessage.toString()));
    }
  }
}
