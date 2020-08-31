import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/task.dart';
import 'package:todoapp_flutter/todo_task.dart';

class ItemTask extends StatelessWidget{
  final Task task;
  const ItemTask({ this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title, style: TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'hello',  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Checkbox(
              value: task.isDone,
              onChanged: (bool checked) {
                Provider.of<TodoTask>(context, listen: false).toggleTodo(task);
              },
            ),
          ),
          Text(
            task.time,  style: TextStyle(color: Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

}