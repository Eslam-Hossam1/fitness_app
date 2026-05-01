import 'package:flutter/material.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/badge_and_favorite.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_description.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_metadata.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_title.dart';

class PlanInfo extends StatelessWidget {
  const PlanInfo({super.key, required this.plan});
  final FeaturedPlan plan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BadgeAndFavorite(plan: plan),
          const SizedBox(height: 8),
          PlanTitle(name: plan.name),
          const SizedBox(height: 4),
          PlanDescription(description: plan.description),
          const SizedBox(height: 10),
          PlanMetadata(plan: plan),
        ],
      ),
    );
  }
}
