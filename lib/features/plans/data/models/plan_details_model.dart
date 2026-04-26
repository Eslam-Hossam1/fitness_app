import 'package:fitness_app/features/plans/data/models/plan_step_model.dart';
import 'package:fitness_app/features/plans/data/models/plans_model.dart';

class PlanDetailsModel {
  final PlansModel plan;
  final List<PlanStepModel> steps;
  final String durationRange;
  final String frequency;
  final String intensity;

  Map<int, Map<int, List<PlanStepModel>>> get groupedByWeekAndDay {
    Map<int, Map<int, List<PlanStepModel>>> result = {};
    for (var step in steps) {
      result.putIfAbsent(step.week, () => {});
      result[step.week]!.putIfAbsent(step.day, () => []);
      result[step.week]![step.day]!.add(step);
    }
    return result;
  }

  PlanDetailsModel({
    required this.plan,
    required this.steps,
    this.durationRange = '60-90m',
    this.frequency = '5 Days/Wk',
    this.intensity = 'High',
  });
}
