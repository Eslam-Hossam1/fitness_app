import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_image.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_info.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';

class FeaturedPlanCard extends StatelessWidget {
  const FeaturedPlanCard({super.key, required this.plan});

  final FeaturedPlan plan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutePaths.planDetails, extra: plan.id),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.formColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            PlanImage(imageUrl: plan.image),
            Expanded(
              child: PlanInfo(plan: plan),
            ),
          ],
        ),
      ),
    );
  }
}
