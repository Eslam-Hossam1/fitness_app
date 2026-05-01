import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/featured_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';

class FeaturedPlansSkeleton extends StatelessWidget {
  const FeaturedPlansSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SliverList.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => FeaturedPlanCard(
          plan: FeaturedPlan(
            id: 0,
            name: "Plan Name Placeholder",
            description:
                "Plan description placeholder text for skeleton loading state",
            durationWeeks: 4,
            level: "Intermediate",
            image: "placeholder",
            isFeatured: true,
            steps: [],
          ),
        ),
      ),
    );
  }
}
