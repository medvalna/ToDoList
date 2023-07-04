import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/widgets/todotile.dart';

/*
*   - TaskList() - виджет, отвечающий за прорисовку листа тайлов
*   - ToDoTile - прорисовка тайлов
*
* */
class TaskList extends StatelessWidget {
  final List<ToDo> tileList;

  //final bool showFullList;

  const TaskList(this.tileList, {super.key});

  //final List <ТoDo> tileList;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
           /* left: 20.0, */bottom: 20.0, /*right: 20.0,*/ top: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin:
                const EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 5),
            padding: const EdgeInsets.only(right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: separator,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 1.0,
                    spreadRadius: 0.0),
              ],
              borderRadius: BorderRadius.circular(10),
              color: tileBackLight,
            ),
            child: Column(
              children: [for (ToDo todo in tileList) ToDoTile(todo)],
            ),
          ),
        ),
      ),
    );
  }
}
