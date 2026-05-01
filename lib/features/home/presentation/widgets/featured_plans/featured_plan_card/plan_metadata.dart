import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/plan_metadata_item.dart';

class PlanMetadata extends StatelessWidget {
  const PlanMetadata({super.key, required this.plan});
  final FeaturedPlan plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlanMetadataItem(
          icon: Assets.imagesSvgsClock,
          text: '${plan.durationWeeks} weeks',
        ),
        const SizedBox(width: 16),
        PlanMetadataItem(
          icon: Assets.imagesSvgsDumbleIcon,
          text: plan.level,
        ),
      ],
    );
  }
}
