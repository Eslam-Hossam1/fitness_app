import 'package:fitness_app/features/plans/data/models/plans_model.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.plan, required this.onTap});
  final PlansModel plan;
  final VoidCallback onTap;

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return const Color(0xFF0F172A);
      case 'advanced':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2E),
          borderRadius: BorderRadius.circular(16.r(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r(context))),
                  child: CustomCachedNetworkImage(
                    url: plan.image,
                    height: 180.h(context),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // Optimizing memory by matching cache size to display height
                    memCacheHeight: 180.h(context).toInt(),
                  ),
                ),
                Positioned(
                  top: 12.h(context),
                  right: 12.w(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w(context), vertical: 4.h(context)),
                    decoration: BoxDecoration(
                      color: _getLevelColor(plan.level),
                      borderRadius: BorderRadius.circular(6.r(context)),
                    ),
                    child: Text(
                      plan.level.toUpperCase(),
                      style: AppTextStyles.bold10(context, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.r(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          plan.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bold18(context, color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          SizedBox(width: 2.w(context)),
                          Text(
                            plan.rating.toString(),
                            style: AppTextStyles.regular13(context, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h(context)),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w(context)),
                      Text(
                        '${plan.durationWeeks} Weeks',
                        style: AppTextStyles.regular13(context, color: Colors.grey),
                      ),
                      SizedBox(width: 16.w(context)),
                      const Icon(
                        Icons.access_time_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w(context)),
                      Text(
                        '${plan.minutesPerDay} Min/Day',
                        style: AppTextStyles.regular13(context, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h(context)),
          ],
        ),
      ),
    );
  }
}
