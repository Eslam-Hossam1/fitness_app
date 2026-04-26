import 'package:fitness_app/features/plans/data/models/plan_details_model.dart';
import 'package:fitness_app/features/plans/data/repos/plan_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plan_details_state.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit(this.repo) : super(PlanDetailsInitial());

  final PlanDetailsRepo repo;

  Future<void> getPlanDetails(int planId) async {
    emit(PlanDetailsLoading());

    try {
      final planDetails = await repo.getPlanDetails(planId);
      emit(PlanDetailsSuccess(planDetails:  planDetails));
    } catch (e) {
      emit(PlanDetailsFailure(e.toString()));
    }
  }
}
