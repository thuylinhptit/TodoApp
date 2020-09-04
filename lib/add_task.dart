import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/add_item.dart';
import 'package:todoapp_flutter/list_items.dart';
import 'package:todoapp_flutter/task.dart';
import 'package:todoapp_flutter/todo_task.dart';
class AddTask extends StatefulWidget{
  Task task;
  int index;
  AddTask({this.task, this.index});
  @override
  _AddTask createState() => _AddTask();

}
class _AddTask extends State<AddTask>{
  final taskTextController = TextEditingController();
  final taskContent = TextEditingController();
  int check = 0;
  Color colors = Colors.pink;
  bool statusDone = false;
  DateTime picker;
  TimeOfDay _time;
  @override
  void initState() {
    picker = DateTime.now();
    _time = TimeOfDay.now();
    super.initState();
    if( widget.task != null ){
      taskTextController.text = widget.task.title;
    }
  }
  @override
  void dispose() {
    taskTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create List', style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView(
        children:[
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: taskTextController,
                decoration: InputDecoration(
                  labelText: 'Add Todo',
                  labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.blue)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TextField(
                  controller:taskContent,
                  decoration: InputDecoration(
                      hintText: 'Add Content',
                      hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.black26)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                    title: Text(
                      'Add', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add, color: Colors.black,),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddItem())),
                    )
                ),
              ),
              Container(
                height: 100,
                child: Consumer<TodoTask>(
                  builder: (context, model, _ ){
                    return ListItems( listItem: model.items,);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 7, 5, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Text(
                        'Priority', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        FlatButton(
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.circle
                            ),
                          ),
                          onPressed: () {
                            colors = Colors.pink;
                            check = 1;
                          },
                        ),
                        FlatButton(
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle
                            ),
                          ),
                          onPressed: () {
                            colors = Colors.orange;
                            check = 2;
                          },
                        ),
                        FlatButton(
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                shape: BoxShape.circle
                            ),
                          ),
                          onPressed: () {
                            colors = Colors.lightGreen;
                            check = 3;
                          }
                        )
                      ],
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                    title:Text(
                        'Choose Date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)
                    ),
                    subtitle: Text(
                        '${picker.day}/${picker.month}/${picker.year}', style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: chooseDate,
                      icon: Icon(Icons.calendar_today, color: Colors.blue,),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                    title:Text(
                      'Choose Time', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      '${_time.hour}:${_time.minute}', style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    trailing: IconButton(
                      onPressed: chooseTime,
                      icon: Icon(Icons.alarm, color: Colors.blue,),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: onSubmit,
                  child: Text(
                    'Save', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
       ]
      ),
    );
  }
  chooseDate() async {
    DateTime date = await showDatePicker(context: context , initialDate: picker,
        firstDate: DateTime(DateTime.now().year-5), lastDate: DateTime(DateTime.now().year+5));
    if( date != null ){
      setState(() {
        picker = date;
      });
    }
  }
  void chooseTime() async{
    TimeOfDay time = await showTimePicker(context: context, initialTime: _time);
    if( time != null  ){
      setState(() {
        _time = time;
      });
    }
  }

  void onSubmit(){
    print('Add');
    final String textTask = taskTextController.text;
    final String contentTask = taskContent.text;
    print('${taskTextController}');
    final bool isDone = statusDone;
    var todoProvider = Provider.of<TodoTask>(context, listen: false);
    if( textTask.isNotEmpty ){
      Task todo = Task( title: textTask, content: contentTask, isDone: isDone,
          time: '${picker.day}/${picker.month}/${picker.year}', color: colors);
      todoProvider.addTask(todo);
      List <int> Check = new List();
      List <Task> ListTask = new List();
      ListTask.add(todo);
      Check.add(check);
      Map <int, Task> map = Map.fromIterables(Check,ListTask);
      map.keys.toList()..sort();
      todoProvider.update();
      Navigator.pop(context);
      print('Done Add');
    }

  }


}