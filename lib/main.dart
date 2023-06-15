import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/pages/addScreen.dart';
import 'package:to_do_list/widgets/addbutton.dart';
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
  String shouldRefresh;
  @override
  void initState() {
    shouldRefresh = "";
    _currentToDos = toDosList;
    super.initState();
  }
  void _refreshData(String task) {
    //toDosList = (new)ToDo.taskcollection();

    /*for(ToDo todo in ToDo.taskcollection()){
      print(todo.toDoText);
    }*/
    //print(toDosList.last.toDoText);
    setState( () {
      toDosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: task, isDone: 0));
      print("локальная печать");
      for(ToDo todo in toDosList){
        print(todo.toDoText);
      }
    });
  }
  String _printToDos() {
    //_currentToDos = toDosList;
    super.initState();
    print("печать d main");
    for(ToDo todo in toDosList){
      print(todo.toDoText);
    }
    return toDosList.last.toDoText;
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
          children: [
            CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: CustomSliverAppBarDelegate(expandedHeight: 160),
                  pinned: true,
                ),

                //appBar(true),
                //header(),
                taskList(toDosList),
              ],
            ),

            //addButton(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  //color: add,
                ),
                child: FloatingActionButton(
                  onPressed: () async => {

                    shouldRefresh = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(builder: (context) => addScreen())),
                    if (shouldRefresh != "")
                      {
                        _refreshData(shouldRefresh),
                      }
                  },
                  child: Icon(
                    Icons.add,
                    size: 28,
                    color: tileback_light,
                  ),
                ),
              ),
            ),
            //TODO redraw page after pushing button
          ],

        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,

  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      //fit: StackFit.expand,
      //overflow: Overflow.visible,
      children: [
        Container(
          color: back_light,
        ),
        Positioned(
          top: 80,
          left: 60,
          right: 20,
          child: buildAppBar(shrinkOffset),
        ),
        Positioned(
          top: 10,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / 100;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: Container(
          color: back_light,
          padding: EdgeInsets.only(top: 30, right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Мои дела",
                  style: TextStyle(color: maintext, fontSize: largetitle),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                //TODO добавить анимацию передвижения виджета глаза
                child: Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Container(
          color: back_light,
          //padding: EdgeInsets.only(top: 30, right: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  "Мои дела",
                  style: TextStyle(color: maintext, fontSize: largetitle),
                ),
              ),
              header(),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
