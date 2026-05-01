import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorite_toggle_button.dart';
import 'package:fitness_app/features/plans/data/models/plan_details_model.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details/chip_and_stat_item.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plan_details/day_card.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fitness_app/core/widgets/custom_cached_network_image.dart';
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
          expandedHeight: 260.h(context),
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
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Stack(
              fit: StackFit.expand,
              children: [
                CustomCachedNetworkImage(
                  url: plan.image,
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3, 1.0],
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                        Colors.black87,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w(context), vertical: 20.h(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Chip(label: plan.level.toUpperCase(), color: Colors.blue),
                    SizedBox(width: 8.w(context)),
                    Chip(
                      label: '${plan.durationWeeks} WEEKS',
                      color: const Color(0xFF1E1E2E),
                    ),
                    const Spacer(),
                    FavoriteToggleButton(
                      plan: FavoritePlanModel(
                        id: plan.id,
                        title: plan.name,
                        description: plan.description,
                        duration: '${plan.durationWeeks} Weeks',
                        level: plan.level,
                        image: plan.image,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                Text(
                  plan.name,
                  style: AppTextStyles.bold25(context, color: Colors.white),
                ),
                SizedBox(height: 8.h(context)),
                Text(
                  plan.description,
                  style: AppTextStyles.regular14(context, color: Colors.grey),
                ),
                SizedBox(height: 20.h(context)),
                Row(
                  children: [
                    Expanded(
                      child: StatItem(
                        icon: Icons.timer_outlined,
                        label: 'Duration',
                        value: widget.planDetails.durationRange,
                      ),
                    ),
                    SizedBox(width: 8.w(context)),
                    Expanded(
                      child: StatItem(
                        icon: Icons.fitness_center,
                        label: 'Frequency',
                        value: widget.planDetails.frequency,
                      ),
                    ),
                    SizedBox(width: 8.w(context)),
                    Expanded(
                      child: StatItem(
                        icon: Icons.local_fire_department_outlined,
                        label: 'Intensity',
                        value: widget.planDetails.intensity,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Week 1: Foundations',
                      style: AppTextStyles.bold18(context, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All Weeks'),
                    ),
                  ],
                ),
                SizedBox(height: 12.h(context)),
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
