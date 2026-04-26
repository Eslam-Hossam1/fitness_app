import 'package:flutter/material.dart';
import 'package:fitness_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:fitness_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:fitness_app/features/home/presentation/widgets/featured_plans/featured_plans_builder.dart';
import 'package:fitness_app/features/home/presentation/widgets/common/home_section_header.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/core/routing/routes_paths.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverHeightSpace(height: 24),
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverHeightSpace(height: 24),
        SliverToBoxAdapter(
          child: HomeSectionHeader(
            title: 'Featured Workout Plans',
            onTap: () => context.go(RoutePaths.plans),
          ),
        ),
        SliverHeightSpace(height: 16),
        FeaturedPlansBuilder(),
        SliverHeightSpace(height: 24),
      ],
    );
  }
}
