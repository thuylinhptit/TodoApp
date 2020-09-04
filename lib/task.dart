import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String title;
  String content;
  bool isDone;
  String time;
  Color color;
  Task({@required this.title, @required this.content, @required this.isDone, @required this.time, @required this.color});

  void toggleTodoCompleted(){
    isDone = !isDone;
  }
}