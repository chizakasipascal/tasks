import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';
import 'views/screens/StackScreens.dart';

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set device orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Task Test',
      theme: AppTheme().light,
      debugShowCheckedModeBanner: false,
      home: Stackcreens(),
    );
  }
}
