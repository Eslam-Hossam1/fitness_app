class FeaturedPlanStep {
  final int week;
  final int day;
  final String workoutName;
  final int duration;
  final String reps;

  FeaturedPlanStep({
    required this.week,
    required this.day,
    required this.workoutName,
    required this.duration,
    required this.reps,
  });

  factory FeaturedPlanStep.fromJson(Map<String, dynamic> json) => FeaturedPlanStep(
    week: json['week'],
    day: json['day'],
    workoutName: json['workout_name'],
    duration: json['duration'],
    reps: json['reps'],
  );
}
