import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/data/todocollection.dart';


class ToDoTile extends StatelessWidget {
  final ToDo item;
  const ToDoTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      /*
        onDismissed: (direction) {
          if(direction == DismissDirection.endToStart) {
            //to be continued
          } else {

          }
        },*/

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
          Icon(
            item.isDone == 1
                ? Icons.check_box
                : item.isDone == -1
                    ? Icons.crop_square
                    : Icons.check_box_outline_blank,
            color: item.isDone == 1 ? done : item.isDone == -1 ? decline : maintext,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              item.toDoText,
              style: TextStyle(
                fontSize: body,
                color: item.isDone == 1 ? secondarytext : maintext,
                decoration: item.isDone > 0 ? TextDecoration.lineThrough : null,
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
