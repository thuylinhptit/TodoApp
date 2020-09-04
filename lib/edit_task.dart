import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/add_item.dart';
import 'package:todoapp_flutter/item_of_task.dart';
import 'package:todoapp_flutter/list_items.dart';
import 'package:todoapp_flutter/task.dart';
import 'package:todoapp_flutter/todo_task.dart';

class EditTask extends StatefulWidget{
  final Task task;
  final int index ;
  const EditTask({ this.task, this.index});
  @override
  _EditTask createState() => _EditTask();

}

class _EditTask extends State<EditTask>{
  final taskTextController = TextEditingController();
  final taskContent = TextEditingController();
  bool statusDone = false;
  Color colors = Colors.lightGreen;
  DateTime picker;
  TimeOfDay _time;
  @override
  void initState() {
    picker = DateTime.now();
    _time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                'Edit Task', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            body: SingleChildScrollView(
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
                  ListTile(
                    title: Text(
                      'Add items', style: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add, color:  Colors.black,),
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute( builder: (context) => AddItem())),
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
                                onPressed: () => colors = Colors.pink ,
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
                                onPressed: () => colors = Colors.orange ,
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
                                onPressed: () => colors = Colors.lightGreen ,
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
                        'Save List', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.lightBlueAccent,
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
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
    var todoProvider = Provider.of<TodoTask>(context, listen: false);
    if( widget.task != null && widget.index != null ){
      todoProvider.editTask(widget.index, Task(title: taskTextController.text,
          content: taskContent.text, time: '${picker.day}/${picker.month}/${picker.year}',
          color: colors, isDone: widget.task.isDone));
      Navigator.pop(context);
      return;
    }

  }
  
}