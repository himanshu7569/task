import 'package:aman_task/screens/splash_screen.dart';
import 'package:aman_task/utils/work_manager.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  Workmanager().initialize(callbackDispatcher);
  runApp(const TaskApp());
}

///
/// Not using State Management Tool As Project is Small
/// Not using Navigation 2.0 or Named Navigation as Project is Small

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
