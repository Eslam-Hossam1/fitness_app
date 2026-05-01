import 'package:flutter/material.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/featured_plan_card.dart';

class FeaturedPlansList extends StatelessWidget {
  const FeaturedPlansList({super.key, required this.plans});

  final List<FeaturedPlan> plans;

  @override
  Widget build(BuildContext context) {
    if (plans.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Center(child: Text('No featured plans available')),
        ),
      );
    }

    return SliverList.separated(
      itemCount: plans.length,
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemBuilder: (context, index) => FeaturedPlanCard(plan: plans[index]),
    );
  }
}
