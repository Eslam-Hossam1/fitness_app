import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';

class PlanDescription extends StatelessWidget {
  const PlanDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.regular12(context).copyWith(
        color: context.secondaryTextColor,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
