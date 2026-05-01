import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AppLogoImage extends StatelessWidget {
  const AppLogoImage({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesPngsAppLogo,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
