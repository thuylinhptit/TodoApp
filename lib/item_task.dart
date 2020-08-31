import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_flutter/task.dart';

class ItemTask extends StatelessWidget{
  final Task task;

  const ItemTask({Key key, this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
                'Shopping'
            ),
            Text(
                'Shopping'
            )
          ],
        ),
        ListTile(
          leading: Checkbox(

            value: task.isDone,
            onChanged: (bool checked) {
            //  Provider.of<TodoTasks>(context, listen: false).toggleTodo(task);
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