import 'package:flutter/cupertino.dart';

class Task {
  String title;
 // String content;
  bool isDone;
  String time;
  Task({@required this.title, this.isDone, this.time});

  void toggleTodoCompleted(){
    isDone = !isDone;
  }
}