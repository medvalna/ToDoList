import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/models/logic_provider.dart';
import 'package:to_do_list/models/todocollection.dart';

import '../main.dart';

class TodoTile extends StatefulWidget {
  ToDo currItem;

  TodoTile(this.currItem);

  @override
  State<TodoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<TodoTile> {
  late final ToDo item;

  @override
  void initState() {
    itemNotifier.addListener(() => mounted ? setState(() {}) : null);
    item = widget.currItem;
    super.initState();
  }

  @override
  void dispose() {
    // 3
    itemNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          itemNotifier.slideDecline(item);
        } else {
          itemNotifier.slideDone(item);
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
              print("tap");
              print(item.isDone);
              itemNotifier.iconDone(item);
            },
            icon: item.isDone ==true
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
              item.toDoText,
              style: TextStyle(
                fontSize: body,
                color: item.isDone == true ? secondarytext : maintext,
                decoration: item.isDone == true ? TextDecoration.lineThrough : null,
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
