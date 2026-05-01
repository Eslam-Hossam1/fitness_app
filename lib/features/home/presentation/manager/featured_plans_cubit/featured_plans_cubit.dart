import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/data/repos/featured_plans_repo.dart';
import 'featured_plans_state.dart';

class FeaturedPlansCubit extends Cubit<FeaturedPlansState> {
  final FeaturedPlansRepo _featuredPlansRepo;

  FeaturedPlansCubit(this._featuredPlansRepo)
    : super(const FeaturedPlansInitial());

  List<FeaturedPlan>? featuredPlans;

  Future<void> getFeaturedPlans() async {
    emit(const FeaturedPlansLoading());
    final result = await _featuredPlansRepo.getFeaturedPlans();
    result.fold((failure) => emit(FeaturedPlansError(failure.errMsg)), (
      plansList,
    ) {
      featuredPlans = plansList;
      emit(const FeaturedPlansLoaded());
    });
  }
}
