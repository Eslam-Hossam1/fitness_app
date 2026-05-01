import 'dart:developer';

import 'package:fitness_app/features/home/data/models/featured_plan.dart';
import 'package:fitness_app/features/home/data/datasources/home_remote_data_source/home_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<FeaturedPlan>> getFeaturedPlans() async {
    final data = await Supabase.instance.client
        .from('plans')
        .select('*, steps:plan_steps(*)')
        .eq('is_featured', true)
        .order('id',ascending: true);
    log('featured plans data: ${data.toString()}');
    return (data as List)
        .map((e) => FeaturedPlan.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
