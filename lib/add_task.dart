import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/task.dart';
import 'package:todoapp_flutter/todo_task.dart';
class AddTask extends StatefulWidget{
  Task task;
  AddTask({this.task});
  @override
  _AddTask createState() => _AddTask();

}
class _AddTask extends State<AddTask>{
  final taskTextController = TextEditingController();
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
                  hintText: 'Add Todo',
                  hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.blue)
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
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                    title: Text(
                      'Priority', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add, color: Colors.black,),
                    )
                ),
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
    print('${taskTextController}');
    final bool isDone = statusDone;
    var todoProvider = Provider.of<TodoTask>(context, listen: false);
    if( textTask.isNotEmpty ){
      Task todo = Task( title: textTask, isDone: isDone, time: '${picker.day}/${picker.month}/${picker.year}');
      todoProvider.addTask(todo);
      Navigator.pop(context);
      print('Done Add');
    }
    print('Notttt');

  }


}