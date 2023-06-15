import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/data/todocollection.dart';
import 'package:to_do_list/pages/addScreen.dart';

class addButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO implement state

    return _addButton();
  }
}

class _addButton extends State<addButton> {
  String shouldRefresh;
  Color color;
  List<ToDo> toDosList = ToDo.taskcollection();
  @override
  void initState() {
    color = add;
    shouldRefresh = "";
    super.initState();
  }

  //int _addtask;
  //addButton(this._addtask);
  void _refreshData(String task) {
    //toDosList = (new)ToDo.taskcollection();

    /*for(ToDo todo in ToDo.taskcollection()){
      print(todo.toDoText);
    }*/
    //print(toDosList.last.toDoText);
    setState( () {
        color = Colors.red;
          toDosList.add(ToDo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              toDoText: task, isDone: 0));
          print("локальная печать");
          for(ToDo todo in toDosList){
            print(todo.toDoText);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    //final bool shouldRefresh;
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          //color: add,
        ),
        child: FloatingActionButton(
          backgroundColor: color,
          onPressed: () async => {
            /*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addScreen()),
            ),*/

            shouldRefresh = await Navigator.push<String>(
                context,
                MaterialPageRoute(builder: (context) => addScreen())),
            if (shouldRefresh != "")
              {
                _refreshData(shouldRefresh),
              }
          },
          child: Icon(
            Icons.add,
            size: 28,
            color: tileback_light,
          ),
        ),
      ),
    );
  }
}
