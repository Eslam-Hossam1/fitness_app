import 'package:fitness_app/features/plans/data/models/plan_details_model.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details/chip_and_stat_item.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details/day_card.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PlanDetailsContent extends StatefulWidget {
  const PlanDetailsContent({super.key, required this.planDetails});

  final PlanDetailsModel planDetails;

  @override
  State<PlanDetailsContent> createState() => _PlanDetailsContentState();
}

class _PlanDetailsContentState extends State<PlanDetailsContent> {
  int? expandedDay;
  @override
  Widget build(BuildContext context) {
    final plan = widget.planDetails.plan;
    final groupedSteps = widget.planDetails.groupedByWeekAndDay;
    final firstWeek = groupedSteps[groupedSteps.keys.first]!;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 260.h,
          pinned: true,
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          title: const Text('Plan Details'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.blue),
              onPressed: () {},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Image.network(
              plan.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF1E1E2E),
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(label: plan.level.toUpperCase(), color: Colors.blue),
                    SizedBox(width: 8.w),
                    Chip(
                      label: '${plan.durationWeeks} WEEKS',
                      color: const Color(0xFF1E1E2E),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  plan.name,
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  plan.description,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: StatItem(
                        icon: Icons.timer_outlined,
                        label: 'Duration',
                        value: widget.planDetails.durationRange,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: StatItem(
                        icon: Icons.fitness_center,
                        label: 'Frequency',
                        value: widget.planDetails.frequency,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: StatItem(
                        icon: Icons.local_fire_department_outlined,
                        label: 'Intensity',
                        value: widget.planDetails.intensity,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Week 1: Foundations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All Weeks'),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ...firstWeek.entries.map((entry) {
                  final day = entry.key;
                  final workouts = entry.value;
                  final isExpanded = expandedDay == day;
                  return DayCard(
                    day: day,
                    workouts: workouts,
                    isExpanded: isExpanded,
                    onTap: () {
                      setState(() {
                        expandedDay = isExpanded ? null : day;
                      });
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
