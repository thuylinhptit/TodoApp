import 'package:flutter/cupertino.dart';
import 'package:todoapp_flutter/item_task.dart';
import 'package:todoapp_flutter/task.dart';

class ListTask extends StatelessWidget{
  final List<Task> listTask ;

  const ListTask({this.listTask});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getTask(),
    );
  }

  List<Widget> getTask() {
    var indexCurrent = -1;
    return listTask.map((e) {
      indexCurrent += 1;
      return ItemTask(task: e, index:  indexCurrent,);
    }).toList();
  }

}