import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/data/todocollection.dart';
import 'package:to_do_list/pages/addScreen.dart';
/*
*   - навигация к странице addScreen через Navigator.push
* */
class AddButton extends StatelessWidget {
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
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddScreen()),
            ),
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
