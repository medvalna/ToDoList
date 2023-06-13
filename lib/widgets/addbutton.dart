import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/pages/addScreen.dart';

class addButton extends StatelessWidget {
  //int _addtask;
  //addButton(this._addtask);
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: add,
          onPressed: () =>
          {
            //_addtask = _addtask + 1,
            //print(_addtask),
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => addScreen()),
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
