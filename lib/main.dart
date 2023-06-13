import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/widgets/addbutton.dart';
import 'package:to_do_list/widgets/appbar.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/tasklist.dart';

import 'data/todocollection.dart';

void main() => runApp(MaterialApp(
      home: Homepage(),
    ));

class Homepage extends StatefulWidget {
  Homepage({key}) : super();

  @override
  State<StatefulWidget> createState() {
    //TODO implement state
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  final toDosList = ToDo.taskcollection();
  List<ToDo> _currentToDos = [];

  @override
  void initState() {
    _currentToDos = toDosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //fontFamily: 'RobotoSlab',
          ),
      home: Scaffold(
        backgroundColor: back_light,
        body: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              slivers: [
                appBar(true),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 46,
                    child: header(),
                  ),
                ),
                taskList(),
              ],
            ),
            addButton(),
          ],
        ),
      ),
    );
  }
}
