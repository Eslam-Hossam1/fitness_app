import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorite_plan_card.dart';
import 'package:flutter/material.dart';

class FavoritesList extends StatelessWidget {
  final List<FavoritePlanModel> plans;
  const FavoritesList({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w(context),
            vertical: 8.h(context),
          ),
          child: Text(
            'SAVED ROUTINES',
            style: AppTextStyles.bold12(context).copyWith(
              color: context.secondaryTextColor,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w(context),
              vertical: 8.h(context),
            ),
            itemCount: plans.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h(context)),
            itemBuilder: (context, index) {
              return FavoritePlanCard(plan: plans[index]);
            },
          ),
        ),
      ],
    );
  }
}
