import 'package:fitness_app/features/favorites/data/models/favorite_plan_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<FavoritePlanModel>> getFavorites();
  Future<void> addFavorite(int planId);
  Future<void> removeFavorite(int planId);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final SupabaseClient _client;

  FavoritesRemoteDataSourceImpl(this._client);

  @override
  Future<List<FavoritePlanModel>> getFavorites() async {
    final userId = _client.auth.currentUser!.id;

    final data = await _client
        .from('favourites')
        .select('plan_id, plans(*)')
        .eq('user_id', userId);

    return (data as List)
        .map((e) => FavoritePlanModel.fromJson(e['plans']))
        .toList();
  }

  @override
  Future<void> addFavorite(int planId) async {
    final userId = _client.auth.currentUser!.id;

    await _client.from('favourites').insert({
      'user_id': userId,
      'plan_id': planId,
    });
  }

  @override
  Future<void> removeFavorite(int planId) async {
    final userId = _client.auth.currentUser!.id;

    await _client
        .from('favourites')
        .delete()
        .eq('user_id', userId)
        .eq('plan_id', planId);
  }
}
