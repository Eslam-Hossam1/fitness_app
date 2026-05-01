import 'package:fitness_app/features/home/data/models/featured_plan.dart';

abstract class HomeRemoteDataSource {
  Future<List<FeaturedPlan>> getFeaturedPlans();
}
