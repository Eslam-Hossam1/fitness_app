import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/features/home/presentation/manager/featured_plans_cubit/featured_plans_cubit.dart';
import 'package:fitness_app/features/home/presentation/manager/featured_plans_cubit/featured_plans_state.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plans_list.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plans_skeleton.dart';
import 'package:fitness_app/features/home/presentation/widgets/common/home_error_widget.dart';

class FeaturedPlansBuilder extends StatelessWidget {
  const FeaturedPlansBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedPlansCubit, FeaturedPlansState>(
      builder: (context, state) {
        if (state is FeaturedPlansLoaded) {
          final plans = context.read<FeaturedPlansCubit>().featuredPlans ?? [];
          return FeaturedPlansList(plans: plans);
        } else if (state is FeaturedPlansError) {
          return HomeErrorWidget(
            message: state.message,
            onRetry: () => context.read<FeaturedPlansCubit>().getFeaturedPlans(),
          );
        } else {
          return const FeaturedPlansSkeleton();
        }
      },
    );
  }
}
