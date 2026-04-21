import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';

class LevelBadge extends StatelessWidget {
  const LevelBadge({super.key, required this.level});

  final String level;

  Color _badgeColor() {
    switch (level.toLowerCase()) {
      case 'beginner':
        return const Color(0xFF4CAF50);
      case 'intermediate':
        return const Color(0xFF2196F3);
      case 'advanced':
        return const Color(0xFFFF5722);
      default:
        return const Color(0xFF9E9E9E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _badgeColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        level.toUpperCase(),
        style: AppTextStyles.medium10(context).copyWith(
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
