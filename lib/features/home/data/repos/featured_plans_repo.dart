import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/supabase_failure.dart';
import 'package:fitness_app/features/home/data/models/featured_plan.dart';

abstract class FeaturedPlansRepo {
  Future<Either<SupabaseFailure, List<FeaturedPlan>>> getFeaturedPlans();
}
