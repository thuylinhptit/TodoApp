import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/todo_task.dart';

import 'item_of_task.dart';

class Item extends StatelessWidget{
  final ItemOfTask item;
  int index;
  Item({ @required this.item, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Checkbox(
            value: item.isdone,
            onChanged: (bool checked){
              Provider.of<TodoTask>(context, listen: false).itemCompleted(item);
            },
          ),
          Text(
              item.name, style: TextStyle(color: Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      );
  }

}