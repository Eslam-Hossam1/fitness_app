import 'package:fitness_app/features/plans/presentation/view_models/plan_details_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details/plan_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanDetailsViewBody extends StatelessWidget {
  const PlanDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanDetailsCubit, PlanDetailsState>(
      builder: (context, state) {
        if (state is PlanDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlanDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is PlanDetailsSuccess) {
          return PlanDetailsContent(planDetails: state.planDetails);
          // return SizedBox();
        }
        return const SizedBox();
      },
    );
  }
}
