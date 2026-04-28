
import 'package:fitness_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.65,
      child: Image.asset(
        Assets.imagesPngsSplashTreadmill,
        fit: BoxFit.cover,
      ),
    );
  }
}