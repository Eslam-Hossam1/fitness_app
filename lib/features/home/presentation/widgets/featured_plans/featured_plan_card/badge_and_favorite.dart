import 'package:flutter/material.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorite_toggle_button.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/level_badge.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:fitness_app/features/home/data/models/featured_plan.dart';

class BadgeAndFavorite extends StatelessWidget {
  const BadgeAndFavorite({super.key, required this.plan});
  final FeaturedPlan plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.ignore(child: LevelBadge(level: plan.level)),
        const Spacer(),
        Skeleton.ignore(
          child: FavoriteToggleButton(
            plan: FavoritePlanModel(
              id: plan.id,
              title: plan.name,
              description: plan.description,
              duration: '${plan.durationWeeks} Weeks',
              level: plan.level,
              image: plan.image,
            ),
          ),
        ),
      ],
    );
  }
}
