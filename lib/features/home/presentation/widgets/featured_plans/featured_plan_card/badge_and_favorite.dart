import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plan_card/level_badge.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BadgeAndFavorite extends StatelessWidget {
  const BadgeAndFavorite({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.ignore(child: LevelBadge(level: level)),
        const Spacer(),
        Icon(
          Icons.favorite_border,
          color: context.secondaryTextColor,
          size: 22,
        ),
      ],
    );
  }
}
