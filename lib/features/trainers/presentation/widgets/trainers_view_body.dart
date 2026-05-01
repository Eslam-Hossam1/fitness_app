import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import '../manager/trainers_cubit/trainers_cubit.dart';
import '../manager/trainers_cubit/trainers_state.dart';
import 'trainer_card.dart';
import 'trainers_search_bar.dart';

class TrainersViewBody extends StatelessWidget {
  const TrainersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverHeightSpace(height: 24),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Trainers',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'IronPulse',
                  style: TextStyle(
                    color: context.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverHeightSpace(height: 24),
        const SliverToBoxAdapter(child: TrainersSearchBar()),
        const SliverHeightSpace(height: 24),
        BlocBuilder<TrainersCubit, TrainersState>(
          builder: (context, state) {
            if (state is TrainersLoading) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is TrainersError) {
              return SliverFillRemaining(
                child: Center(child: Text(state.message, style: const TextStyle(color: Colors.red))),
              );
            } else if (state is TrainersLoaded) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TrainerCard(trainer: state.trainers[index]);
                  },
                  childCount: state.trainers.length,
                ),
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
        const SliverHeightSpace(height: 24),
      ],
    );
  }
}
