import 'package:fitness_app/features/plans/data/models/plan_details_model.dart';
import 'package:fitness_app/features/plans/data/models/plan_step_model.dart';
import 'package:fitness_app/features/plans/data/models/plans_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlanDetailsRepo {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<PlanDetailsModel> getPlanDetails(int planId) async {
    final planResponse = await supabaseClient
        .from('plans')
        .select()
        .eq('id', planId)
        .single();

    final stepsResponse = await supabaseClient
        .from('plan_steps')
        .select()
        .eq('plan_id', planId);

    final plan = PlansModel.fromJson(planResponse);
    final steps = (stepsResponse as List)
        .map((e) => PlanStepModel.fromJson(e))
        .toList();

    return PlanDetailsModel(plan: plan, steps: steps);
  }
}
