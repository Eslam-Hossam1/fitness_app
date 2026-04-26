import 'package:fitness_app/features/plans/data/models/plans_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlansRepo {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<List<PlansModel>> getPlans() async {
    final response = await supabaseClient.from('plans').select();

    return response.map((e) => PlansModel.fromJson(e)).toList();
  }
}
