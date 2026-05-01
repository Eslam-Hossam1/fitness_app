import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Radial Gradient and Icon
          SizedBox(
            height: 250.h(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Radial Gradient
                Container(
                  width: 250.w(context),
                  height: 250.h(context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        context.primaryColor.withOpacity(0.15),
                        context.primaryColor.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                // Broken Heart Container PNG
                Image.asset(
                  Assets.imagesPngsBrokenHeartIconContainer,
                  width: 220.w(context),
                  height: 220.h(context),
                ),
                // Broken Heart SVG
                SvgPicture.asset(
                  Assets.imagesSvgsBrokenHeart,
                  width: 70.w(context),
                  height: 70.h(context),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h(context)),
          Text(
            "Your Favorites is Empty",
            style: AppTextStyles.bold24(context).copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h(context)),
          Text(
            "Start exploring IronPulse professional plans and add your favorite high-intensity workouts here!",
            style: AppTextStyles.regular16(context).copyWith(
              color: context.secondaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48.h(context)),
          // Browse Plans Button
          SizedBox(
            width: double.infinity,
            height: 56.h(context),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to plans
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.imagesSvgsBrowseMoreIcon,
                    width: 20.w(context),
                    height: 20.h(context),
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8.w(context)),
                  Text(
                    "Browse Plans",
                    style: AppTextStyles.medium16(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
