import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
class ToDoTile extends StatelessWidget{

  final String text;

  const ToDoTile (
      this.text
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
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
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(
          Icons.info_outline,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}