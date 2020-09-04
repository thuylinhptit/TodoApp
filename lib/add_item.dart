import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_flutter/item_of_task.dart';
import 'package:todoapp_flutter/todo_task.dart';

class AddItem extends StatefulWidget{
  ItemOfTask itemOfTask;
  int index;

  AddItem({ this.itemOfTask, this.index});

  @override
  _AddItem createState() => _AddItem();

}
class _AddItem extends State<AddItem>{
  final itemTextController = TextEditingController();
  bool statusDone = false;
  @override
  void initState() {
    super.initState();
    if( widget.itemOfTask != null ){
      itemTextController.text = widget.itemOfTask.name;
    }
  }
  @override
  void dispose() {
    itemTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
       title: Text(
         'Add Item'
       ),
     ),
     body: Column(
       children: [
         TextField(
           controller: itemTextController,
           decoration: InputDecoration(
               labelText: 'Add Item',
               labelStyle: TextStyle( color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
           ),
         ),
         RaisedButton(
           child: Text(
             'Save'
           ),
           onPressed: onAddItem,
         ),

       ],
     ),
   );
  }

  void onAddItem(){
    print('Add');
    final String textItem = itemTextController.text;
    print('${textItem}');
    final bool isDone = statusDone;
    var todoProvider = Provider.of<TodoTask>(context, listen: false);
    if( textItem.isNotEmpty ){
      ItemOfTask todo = ItemOfTask( name: textItem, isdone: isDone);
      todoProvider.addItem(todo);
      Navigator.pop(context);
      print('DOnee');
    }

  }

}

















































































































































































