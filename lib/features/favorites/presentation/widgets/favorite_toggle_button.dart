import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/core/extensions/responsive_extension.dart';
import 'package:fitness_app/core/theme/theme_colors_extension.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteToggleButton extends StatelessWidget {
  final FavoritePlanModel plan;
  const FavoriteToggleButton({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listenWhen: (previous, current) =>
          current is FavoriteToggleReverted && current.planId == plan.id,
      listener: (context, state) {
        if (state is FavoriteToggleReverted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              action: SnackBarAction(
                label: 'OK',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          (current is FavoriteToggled && current.planId == plan.id) ||
          (current is FavoriteToggleReverted && current.planId == plan.id) ||
          current is FavoritesSuccess ||
          current is FavoritesEmpty,
      builder: (context, state) {
        final favoritesCubit = context.read<FavoritesCubit>();
        final isFavorite = favoritesCubit.isFavorite(plan.id);

        return GestureDetector(
          onTap: () => favoritesCubit.toggleFavorite(plan.id, plan: plan),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(isFavorite),
              color: isFavorite ? context.primaryColor : context.secondaryTextColor,
              size: 28.w(context),
            ),
          ),
        );
      },
    );
  }
}
