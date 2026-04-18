import 'package:fitness_app/core/utils/app_initializer.dart';
import 'package:fitness_app/fitness_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(const FitnessApp());
}
