import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/widgets/appbar.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/tasklist.dart';

import 'package:to_do_list/adaptivity/font_sizes.dart';



class addScreen extends StatefulWidget {
  addScreen({key}) : super();
  @override
  State<StatefulWidget> createState() {
    //TODO implement state

    return _addScreen();
  }
}
class _addScreen extends State<addScreen> {
  int _saved;
  @override
  void initState() {
    _saved = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back_light,
      appBar: AppBar(
        backgroundColor: back_light,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: secondarytext,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Spacer(),
            SizedBox(
              width:150,
                child:FloatingActionButton(
                  elevation: 0,
                  backgroundColor: back_light,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero
                  ),
                  child: Text('сохранить',
                    style: TextStyle(fontSize: button, color: add),
                  ),
                  onPressed: () =>
                  {
                    _saved = _saved + 1,
                    print(_saved),
                     Navigator.pop(context),
                  },
                ),
            ),

          ],
        ),
      ),
      body: Center(),
    );
  }
}
