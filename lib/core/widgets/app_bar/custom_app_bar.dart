import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesSvgsElectric,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              context.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'IronPulse',
            style: AppTextStyles.bold20(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.formColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              Assets.imagesSvgsBell,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                context.mainTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
