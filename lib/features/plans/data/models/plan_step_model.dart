class PlanStepModel {
  final int id;
  final int planId;
  final int week;
  final int day;
  final String workoutName;
  final int duration;
  final String reps;

  PlanStepModel({
    required this.id,
    required this.planId,
    required this.week,
    required this.day,
    required this.workoutName,
    required this.duration,
    required this.reps,
  });

  factory PlanStepModel.fromJson(Map<String, dynamic> json) {
    return PlanStepModel(
      id: json['id'],
      planId: json['plan_id'],
      week: json['week'],
      day: json['day'],
      workoutName: json['workout_name'],
      duration: json['duration'],
      reps: json['reps'],
    );
  }
}
