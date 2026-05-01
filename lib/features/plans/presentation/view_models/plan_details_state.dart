part of 'plan_details_cubit.dart';

@immutable
sealed class PlanDetailsState {}

final class PlanDetailsInitial extends PlanDetailsState {}

final class PlanDetailsLoading extends PlanDetailsState {}

final class PlanDetailsSuccess extends PlanDetailsState {
  final PlanDetailsModel planDetails;

  PlanDetailsSuccess({required this.planDetails});
}

final class PlanDetailsFailure extends PlanDetailsState {
  final String errorMessage;
  PlanDetailsFailure(this.errorMessage);
}
