
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF17212E),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkPrimary.withValues(alpha: 0.15),
                blurRadius: 30,
                spreadRadius: 10,
              ),
            ],
          ),
          child: const Icon(Icons.fitness_center, color: Colors.white, size: 45),
        ),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'IRON',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
              TextSpan(
                text: 'PULSE',
                style: TextStyle(
                  color: AppColors.darkPrimary,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 3,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.darkPrimary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'FEEL THE ENERGY',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 6.0,
          ),
        ),
      ],
    );
  }
}