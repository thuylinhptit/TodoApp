import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/list_task.dart';
import 'package:todoapp_flutter/todo_task.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();

}
var time = DateTime.now();
String formattedDate = DateFormat('dd/MM/yyyy').format(time);

class _HomeScreen extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlueAccent,
              title: Text('To do', style:  TextStyle(
                  color: Colors.white, fontSize: 25
              ),),
            ),
            body:  Container(
//              decoration: BoxDecoration(
//                gradient: LinearGradient(
//                  begin: Alignment.topRight,
//                  end: Alignment.bottomLeft,
//                  colors: [ Colors.white, Colors.lightBlueAccent],
//                ),
//              ),
              child: Consumer<TodoTask>(
                builder: (context, model, _ ){

                  return ListTask(listTask: model.tasks,);
                },
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 20),
              child: FloatingActionButton(
                child: Icon(Icons.create, color: Colors.white,),
                backgroundColor: Colors.lightBlueAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
                },
              ),
            ),

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 10, 0),
            child: Text(
              '$formattedDate', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold,decoration:TextDecoration.none,),
            ),
          ),
        ],
      ),
    );
  }

}