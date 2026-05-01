import 'package:equatable/equatable.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

// ── Get Favorites States ──────────────────────────────────────────────────
final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {}

final class FavoritesFailure extends FavoritesState {
  final String errorMessage;

  const FavoritesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class FavoritesEmpty extends FavoritesState {}

// ── Optimistic Toggle States ──────────────────────────────────────────────

/// Emitted immediately when the user taps the favorite button.
/// The UI should reflect the new [isFavorite] value right away.
final class FavoriteToggled extends FavoritesState {
  final int planId;
  final bool isFavorite;

  const FavoriteToggled({required this.planId, required this.isFavorite});

  @override
  List<Object> get props => [planId, isFavorite];
}

/// Emitted when the API call fails and the optimistic update is reverted.
final class FavoriteToggleReverted extends FavoritesState {
  final int planId;
  final bool isFavorite;
  final String errorMessage;

  const FavoriteToggleReverted({
    required this.planId,
    required this.isFavorite,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [planId, isFavorite, errorMessage];
}
