import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plans_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PlansViewBody extends StatelessWidget {
  const PlansViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Find Your Plan',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<PlansCubit, PlansState>(
              builder: (context, state) {
                if (state is PlansLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PlansSuccess) {
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 15.h),
                    itemBuilder: (context, index) {
                      return PlanCard(
                        plan: state.plans[index],
                        onTap: () {
                          context.push(RoutePaths.planDetails, extra: state.plans[index].id);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: state.plans.length,
                  );
                } else if (state is PlansFailure) {
                  return Center(child: Text(state.errorMessage));
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
