import 'package:flutter/material.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    super.key,
    this.lastRadius,
    this.threeRadius,
    this.backgroundColor,
    this.textColor,
    this.textAlign,
    this.isLoading = false,
    this.loadingWidth = 30,
    this.loadingHeight = 30,
  });
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? threeRadius;
  final double? lastRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final TextAlign? textAlign;
  final double? loadingWidth;
  final double? loadingHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular((threeRadius ?? 15).r(context)),
              topRight: Radius.circular((threeRadius ?? 15).r(context)),
              bottomRight: Radius.circular((threeRadius ?? 15).r(context)),
              bottomLeft: Radius.circular((lastRadius ?? 15).r(context)),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.bold16(context).copyWith(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
