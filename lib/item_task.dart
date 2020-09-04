
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/edit_task.dart';
import 'package:todoapp_flutter/task.dart';
import 'package:todoapp_flutter/todo_task.dart';

class ItemTask extends StatelessWidget{
  final Task task;
   int index;
   ItemTask({@required this.task, @required this.index});
  @override
  Widget build(BuildContext context) {
    Color _color;
    var rm = new Random();
    var rng;
    for (var i = 0; i < 1; i++) {
      rng = (rm.nextInt(5));
    }
    if( rng == 0 ){
      _color = Colors.pinkAccent;
    }
    else if( rng == 1 ){
      _color = Colors.lightGreen;
    }
    else if( rng == 2 ){
      _color = Colors.orangeAccent;
    }
    else if( rng == 3 ){
      _color = Colors.purpleAccent;
    }
    else {
      _color = Colors.lightBlueAccent;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
       // actionExtentRatio: 0.25,
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 20, 15),
          padding: EdgeInsets.fromLTRB(7, 5, 0, 7),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      task.content,  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
               Checkbox(
                  value: task.isDone,
                  onChanged: (bool checked) {
                    Provider.of<TodoTask>(context, listen: false).toggleTodo(task);
                  },
                ),
              Text(
                task.time,  style: TextStyle(color: Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              FlatButton(
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: task.color,
                    shape: BoxShape.circle
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.015, 0.015],
              colors: [_color, Colors.white],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue[200],
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 13),
            child: IconSlideAction(
              icon: Icons.delete,
              caption: "Delete",
              color: Colors.amber,
              onTap:() => Delete(context, index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 13),
            child: IconSlideAction(
              icon: Icons.edit,
              caption: "Edit",
              color: Colors.lightBlueAccent,
              onTap: ()  => Navigator.of(context).push(MaterialPageRoute( builder: (context) => EditTask(task: task, index:  index,),
              fullscreenDialog: true)),
              closeOnTap: false,
            ),
          )
        ],
      ),
    );
  }
  Future <bool> Delete(BuildContext context, int index){
    return showDialog <bool> (
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(false)
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Provider.of<TodoTask>(context, listen:  false).delete(index);
                  Navigator.of(context).pop(true);
                }
              )
            ],
          );
      }
    );
  }

}