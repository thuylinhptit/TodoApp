import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/home_screen.dart';
import 'package:todoapp_flutter/todo_task.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TodoTask>(
      create: (context){
        return TodoTask();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    )
  );
}

