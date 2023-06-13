import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

class ToDoTile extends StatelessWidget{

  final String text;

  const ToDoTile (this.text,);

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
          child: Icon(Icons.check, color: tileback_light,),
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 10),
      color: decline,
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: tileback_light,),
      ),
    ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.check_box_outline_blank,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: body,
                color: maintext,
                //color: item.isDone > 0 ? secondarytext :maintext,
                //decoration: item.isDone > 0 ? TextDecoration.lineThrough : null,
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