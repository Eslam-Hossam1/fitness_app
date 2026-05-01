import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:fitness_app/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/empty_favorites_view.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorites_header.dart';
import 'package:fitness_app/features/favorites/presentation/widgets/favorites_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FavoritesHeader(),
        Expanded(
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            buildWhen: (previous, current) =>
                current is FavoritesSuccess ||
                current is FavoritesEmpty ||
                current is FavoritesLoading ||
                current is FavoritesFailure ||
                current is FavoriteToggled ||
                current is FavoriteToggleReverted,
            builder: (context, state) {
              if (state is FavoritesLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FavoritesFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              final cubit = context.read<FavoritesCubit>();

              if (cubit.favoritePlans.isEmpty) {
                return const EmptyFavoritesView();
              }

              return FavoritesList(plans: cubit.favoritePlans);
            },
          ),
        ),
      ],
    );
  }
}
