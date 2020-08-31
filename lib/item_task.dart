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
    return Row(
      children: [
        Text(
            task.title, style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (bool checked) {
              Provider.of<TodoTask>(context, listen: false).toggleTodo(task);
            },
          ),
          title: Text(
            task.title, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        Text(
          '12.00 PM'
        )
      ],
    );
  }

}