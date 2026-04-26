import 'package:fitness_app/features/plans/data/repos/plan_details_repo.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plan_details_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key, required this.planId});

  final int planId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PlanDetailsCubit(PlanDetailsRepo())..getPlanDetails(planId),
      child: Scaffold(
        body: const PlanDetailsViewBody(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: const Text(
              'START WORKOUT',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
