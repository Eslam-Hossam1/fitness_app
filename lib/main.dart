import 'package:fitness_app/core/utils/app_initializer.dart';
import 'package:fitness_app/fitness_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AppInitializer.initialize();

  runApp(const FitnessApp());
}
