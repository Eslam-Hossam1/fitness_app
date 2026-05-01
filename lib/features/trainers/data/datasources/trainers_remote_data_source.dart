import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trainer_model.dart';

abstract class TrainersRemoteDataSource {
  Future<List<TrainerModel>> getTrainers();
}

class TrainersRemoteDataSourceImpl implements TrainersRemoteDataSource {
  final SupabaseClient _supabaseClient;

  TrainersRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<TrainerModel>> getTrainers() async {
    final response = await _supabaseClient
        .from('trainers')
        .select();
    
    return (response as List)
        .map((trainer) => TrainerModel.fromJson(trainer))
        .toList();
  }
}
