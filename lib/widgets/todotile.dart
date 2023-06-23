import 'dart:collection';

import 'package:flutter/hosted/pub.dev/flutter_bloc-8.1.3/lib/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/models/todo.dart';

import '../bloc/todo_bloc.dart';
import '../main.dart';
import '../models/persistence_manager.dart';

class ToDoTile extends StatelessWidget {
  final ToDo item;

  //late PersistenceManager manager;

  ToDoTile(this.item) {
    //manager = PersistenceManager();
  }

  //get manager => PersistenceManager();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          context.read<TileListBloc>().add(DeleteTile(tile: item));
        } else {
          context.read<TileListBloc>().add(TappedDone(tile: item));
        }
      },
      key: UniqueKey(),
      background: Container(
        padding: EdgeInsets.only(left: 10),
        color: done,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.check,
            color: tileback_light,
          ),
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 10),
        color: decline,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: tileback_light,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              context.read<TileListBloc>().add(TappedDone(tile: item));
            },
            icon: item.isDone == true
                ? Icon(Icons.check_box)
                : item.isDone == false
                    ? Icon(Icons.check_box_outline_blank)
                    : Icon(Icons.check_box_outline_blank),
            color: item.isDone == true
                ? done
                : item.isDone == false
                    ? decline
                    : maintext,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              item.task,
              style: TextStyle(
                fontSize: body,
                color: item.isDone == true ? secondarytext : maintext,
                decoration:
                    item.isDone == true ? TextDecoration.lineThrough : null,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.info_outline,
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
