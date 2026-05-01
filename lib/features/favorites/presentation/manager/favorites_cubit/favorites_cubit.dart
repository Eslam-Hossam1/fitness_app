import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:fitness_app/features/favorites/data/models/favorite_params.dart';
import 'package:fitness_app/features/favorites/data/repos/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _repository;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  List<FavoritePlanModel> favoritePlans = [];
  final Set<int> _favoritePlanIds = {};

  bool isFavorite(int planId) => _favoritePlanIds.contains(planId);

  Future<void> getFavorites() async {
    if (favoritePlans.isEmpty) {
      emit(FavoritesLoading());
    }
    
    final result = await _repository.getFavorites();
    result.fold(
      (failure) {
          emit(FavoritesFailure(errorMessage: failure.errMsg));
        
      },
      (plans) {
        favoritePlans = List.from(plans);
        _favoritePlanIds
          ..clear()
          ..addAll(favoritePlans.map((e) => e.id));

        if (favoritePlans.isEmpty) {
          emit(FavoritesEmpty());
        } else {
          emit(FavoritesSuccess());
        }
      },
    );
  }

  /// Optimistically toggles the favorite state of a plan.
  ///
  /// 1. Immediately updates the local state and emits [FavoriteToggled].
  /// 2. Fires the API call in the background.
  /// 3. On success → silently syncs the full list.
  /// 4. On failure → reverts the local state and emits [FavoriteToggleReverted].
  Future<void> toggleFavorite(int planId, {FavoritePlanModel? plan}) async {
    final wasAlreadyFavorite = isFavorite(planId);

    // ── Step 1: Optimistic update ──────────────────────────────────────────
    if (wasAlreadyFavorite) {
      _favoritePlanIds.remove(planId);
      favoritePlans.removeWhere((p) => p.id == planId);
    } else {
      _favoritePlanIds.add(planId);
      if (plan != null) {
        favoritePlans.add(plan);
      }
    }

    emit(FavoriteToggled(
      planId: planId,
      isFavorite: !wasAlreadyFavorite,
    ));

    // ── Step 2: Fire API call ──────────────────────────────────────────────
    final result = wasAlreadyFavorite
        ? await _repository.removeFavorite(FavoriteParams(planId: planId))
        : await _repository.addFavorite(FavoriteParams(planId: planId));

    result.fold(
      // ── Step 4: Revert on failure ────────────────────────────────────────
      (failure) {
        if (wasAlreadyFavorite) {
          _favoritePlanIds.add(planId);
          if (plan != null) favoritePlans.add(plan);
        } else {
          _favoritePlanIds.remove(planId);
          favoritePlans.removeWhere((p) => p.id == planId);
        }

        emit(FavoriteToggleReverted(
          planId: planId,
          isFavorite: wasAlreadyFavorite,
          errorMessage: failure.errMsg,
        ));
      },
      // ── Step 3: Sync on success ──────────────────────────────────────────
      (_) async {
        await getFavorites();
      },
    );
  }
}
