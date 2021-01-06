import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mgr/tasks_provider.dart';
import 'package:todo_mgr/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        child: TasksScreen(),
        create: (context) => TaskProvider(),
      ),
    );
  }
}
