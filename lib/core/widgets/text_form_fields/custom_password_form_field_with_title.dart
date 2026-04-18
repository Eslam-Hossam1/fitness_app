import 'package:flutter_svg/svg.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/core/utils/assets.dart';
import 'package:fitness_app/core/utils/form_validators.dart';
import 'package:fitness_app/core/widgets/spacing/height_space.dart';
import 'package:fitness_app/core/widgets/text_form_fields/obscure_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormFieldWithTitle extends StatelessWidget {
  const CustomPasswordTextFormFieldWithTitle({
    super.key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.title = 'Password',
    this.hint = 'Enter your password',
  });
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.semiBold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        HeightSpace(height: 4),
        ObscureTextFormField(
          hintText: hint,
          validator: validator ?? FormValidators.passwordValidator,
          onSaved: onSaved,
          onChanged: onChanged,
          prefixIcon: SvgPicture.asset(
            Assets.imagesSvgsLock,
            fit: BoxFit.contain,
            width: 16.w(context),
          ),
        ),
      ],
    );
  }
}
