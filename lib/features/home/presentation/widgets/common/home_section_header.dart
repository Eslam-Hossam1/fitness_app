import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bold18(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'See All',
              style: AppTextStyles.medium14(
                context,
              ).copyWith(color: context.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
