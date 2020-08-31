import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoapp_flutter/task.dart';

class TodoTask extends ChangeNotifier{
  List <Task> _task = [];

  void addTask( Task task ){
    _task.add(task);
    notifyListeners();
  }
  UnmodifiableListView <Task> get tasks => UnmodifiableListView(_task);

  void toggleTodo( Task task ){
    final taskIndex = _task.indexOf(task);
    _task[taskIndex].toggleTodoCompleted();
    notifyListeners();
  }

}