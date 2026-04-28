
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashProgressBar extends StatefulWidget {
  const SplashProgressBar({super.key});

  @override
  State<SplashProgressBar> createState() => _SplashProgressBarState();
}

class _SplashProgressBarState extends State<SplashProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), 
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 220,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: _controller.value,
              minHeight: 4,
              backgroundColor: AppColors.trackColor,
              valueColor:  AlwaysStoppedAnimation<Color>(AppColors.darkPrimary),
            ),
          );
        },
      ),
    );
  }
}