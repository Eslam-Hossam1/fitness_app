import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'sign up view',
        style: AppTextStyles.medium16(
          context,
        ).copyWith(color: context.mainTextColor),
      ),
    );
  }
}
