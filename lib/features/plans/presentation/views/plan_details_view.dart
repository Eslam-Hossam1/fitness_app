import 'package:fitness_app/features/plans/data/repos/plan_details_repo.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plan_details_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';

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
        bottomNavigationBar: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16.w(context),
                right: 16.w(context),
                bottom: 20.h(context),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r(context)),
                  ),
                ),
                child: const Text(
                  'START WORKOUT',
                  style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
