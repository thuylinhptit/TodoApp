import 'package:flutter/material.dart';

class ItemOfTask {
  bool isdone;
  String name;
  ItemOfTask({@required this.isdone, this.name});
  // ignore: non_constant_identifier_names
  void ItemCompleted(){
    isdone = !isdone;
  }
}