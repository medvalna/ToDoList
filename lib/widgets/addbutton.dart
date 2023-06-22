import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/pages/addScreen.dart';
import 'dart:io' show Platform;

import '../models/navigation.dart';
import '../models/todo.dart';
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
            _onOpenAdding(),
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
  void _onOpenAdding() {
    NavigationManager.instance.openAdding();
  }
}
