import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorite_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness_app/core/utils/assets.dart';

class FavoritePlanCard extends StatelessWidget {
  final FavoritePlanModel plan;
  const FavoritePlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w(context)),
      decoration: BoxDecoration(
        color: context.formColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Plan Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomCachedNetworkImage(
              url: plan.image ?? '',
              width: 100.w(context),
              height: 100.h(context),
            ),
          ),
          SizedBox(width: 16.w(context)),
          // Plan Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        plan.title,
                        style: AppTextStyles.bold18(
                          context,
                        ).copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    FavoriteToggleButton(plan: plan),
                  ],
                ),
                SizedBox(height: 4.h(context)),
                Text(
                  plan.description,
                  style: AppTextStyles.regular13(
                    context,
                  ).copyWith(color: context.secondaryTextColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h(context)),
                Row(
                  children: [
                    _buildInfoItem(
                      context,
                      icon: Assets.imagesSvgsClock,
                      label: plan.duration,
                    ),
                    SizedBox(width: 16.w(context)),
                    _buildInfoItem(
                      context,
                      icon: Assets.imagesSvgsElectric,
                      label: plan.level,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required String icon,
    required String label,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 14.w(context),
          height: 14.h(context),
          colorFilter: ColorFilter.mode(
            context.secondaryTextColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 4.w(context)),
        Text(
          label,
          style: AppTextStyles.medium12(
            context,
          ).copyWith(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}
