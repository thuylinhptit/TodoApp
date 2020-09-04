import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_flutter/item_of_task.dart';
import 'package:todoapp_flutter/task.dart';

class TodoTask extends ChangeNotifier{
  List <Task> _task = [];
  List <ItemOfTask> _item = [];

  void addTask( Task task ){
    _task.add(task);
    notifyListeners();
  }
  void addItem( ItemOfTask itemOfTask ){
    _item.add(itemOfTask);
    notifyListeners();
  }
  UnmodifiableListView <Task> get tasks => UnmodifiableListView(_task);
  UnmodifiableListView <ItemOfTask> get items => UnmodifiableListView(_item);

  void toggleTodo( Task task ){
    final taskIndex = _task.indexOf(task);
    _task[taskIndex].toggleTodoCompleted();
    notifyListeners();
  }

  void itemCompleted( ItemOfTask item ){
    final itemIndex = _item.indexOf(item);
    _item[itemIndex].ItemCompleted();
    notifyListeners();
  }

  void delete( int index ){
    _task.removeAt(index);
    notifyListeners();
  }

  void editTask( int index, Task task ){
    _task[index] = task;
    notifyListeners();
  }

  void update(){
    notifyListeners();
  }


}