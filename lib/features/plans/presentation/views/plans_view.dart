import 'package:fitness_app/features/plans/data/repos/plans_repo.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plans_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plans_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansCubit(PlansRepo())..getPlans(),
      child: const Scaffold(
        body: SafeArea(
          child: PlansViewBody(),
        ),
      ),
    );
  }
}
