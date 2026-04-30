import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';

class TrainersSearchBar extends StatelessWidget {
  const TrainersSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 56,
        decoration: BoxDecoration(
          color: context.formColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: context.secondaryTextColor),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: TextStyle(color: context.mainTextColor),
                decoration: InputDecoration(
                  hintText: 'Search by name or specialty',
                  hintStyle: AppTextStyles.medium14(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
