import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/data/todocollection.dart';
import 'package:to_do_list/widgets/todotile.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

class taskList extends StatefulWidget {
  @override
  State<taskList> createState() => _taskListState();
}

class _taskListState extends State<taskList> {
  final toDosList = ToDo.taskcollection();
  List<ToDo> _currentToDos = [];

  @override
  void initState() {
    _currentToDos = toDosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
            padding: EdgeInsets.only(right: 25, left: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: separator,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    spreadRadius: 0.0),
              ],
              borderRadius: BorderRadius.circular(20),
              color: tileback_light,
            ),
            child: Container(
              child: Column(
                children: [
                  for (ToDo todo in _currentToDos) ToDoTile(todo),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
