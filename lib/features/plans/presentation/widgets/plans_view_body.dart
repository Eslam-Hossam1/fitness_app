import 'package:fitness_app/core/routing/routes_paths.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:fitness_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plans_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:go_router/go_router.dart';

class PlansViewBody extends StatelessWidget {
  const PlansViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverHeightSpace(height: 24),
        const SliverToBoxAdapter(child: CustomAppBar()),
        const SliverHeightSpace(height: 24),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Find Your Plan',
              style: AppTextStyles.bold24(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
          ),
        ),
        const SliverHeightSpace(height: 16),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
          sliver: BlocBuilder<PlansCubit, PlansState>(
            builder: (context, state) {
              if (state is PlansLoading) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is PlansSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h(context)),
                        child: PlanCard(
                          plan: state.plans[index],
                          onTap: () {
                            context.push(RoutePaths.planDetails,
                                extra: state.plans[index].id);
                          },
                        ),
                      );
                    },
                    childCount: state.plans.length,
                  ),
                );
              } else if (state is PlansFailure) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text(state.errorMessage)),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ),
        SliverHeightSpace(height: 20.h(context)),
      ],
    );
  }
}
