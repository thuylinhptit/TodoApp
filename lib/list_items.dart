import 'package:flutter/cupertino.dart';
import 'package:todoapp_flutter/item.dart';
import 'package:todoapp_flutter/item_of_task.dart';

class ListItems extends StatelessWidget{
  final List <ItemOfTask> listItem ;

  const ListItems({ this.listItem});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getItem(),
    );
  }

  List<Widget> getItem(){
    var indexCurrent = -1;
    return listItem.map((e) {
      indexCurrent += 1;
      return Item(item: e, index:  indexCurrent,);
    }).toList();
  }
}