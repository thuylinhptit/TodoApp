import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_flutter/choose_date.dart';

import 'choose_time.dart';

class AddTask extends StatefulWidget{
  @override
  _AddTask createState() => _AddTask();

}
class _AddTask extends State<AddTask>{
  @override
  Widget build(BuildContext context) {
    TextEditingController controllor = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create List', style: TextStyle(fontSize: 25, color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Add Todo',
                hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.redAccent)
              ),
            ),
            Row(
              children: [
                Text(
                  'Add', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.black,),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Priority', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
               children: [
                 GestureDetector(
                     onTap: chooseDate,

                     child: Text(
                       'Choose Date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                     )
                 ),
               ],
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                GestureDetector(
                    onTap: chooseTime,
                    child: Text(
                      'Choose Time', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    )
                ),
              ],
            ),
            RaisedButton(
              child: Text(
                'Save', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0)),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
  void chooseDate(){
    Navigator.push(context, MaterialPageRoute( builder: (context) => ChooseDate()));
  }
  void chooseTime(){
    Navigator.push(context, MaterialPageRoute( builder: (context) => ChooseTime()));
  }


}