import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/widgets/todotile.dart';

import '../main.dart';

/*
*   - TaskList() - виджет, отвечающий за прорисовку листа тайлов
*   - ToDoTile - прорисовка тайлов
*
* */
class TaskList extends StatelessWidget {
  final List<ToDo> tileList;
  final bool showFullList;

  const TaskList(this.tileList, this.showFullList);

  //final List <ToDo> tileList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 5),
            padding: EdgeInsets.only(right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: separator,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 1.0,
                    spreadRadius: 0.0),
              ],
              borderRadius: BorderRadius.circular(10),
              color: tileback_light,
            ),
            child: Container(
              child: Column(
                children: [
                  for (ToDo todo in tileList) ToDoTile(todo)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
