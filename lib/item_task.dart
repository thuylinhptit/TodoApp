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
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
      child: Row(
        children: [
          Text(
              task.title, style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Checkbox(
            value: task.isDone,
            onChanged: (bool checked) {
              Provider.of<TodoTask>(context, listen: false).toggleTodo(task);
            },
          ),
          Text(
            '12.00 PM'
          )
        ],
      ),
    );
  }

}