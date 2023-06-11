import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/todotile.dart';

import 'adaptivity/font_sizes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
      ),
      home: Scaffold(
        backgroundColor: back_light,
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      header("4"),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(
                            right: 20, left: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: tileback_light,
                        ),
                        child: Column(
                          children: [
                            ToDoTile("Купить что-то где-то зачем-то"),
                            ToDoTile("Купить что-то"),
                            ToDoTile("Очень-очень-очень-очень длинная таска"),
                            ToDoTile("Очень-очень-очень-очень длинная таска"),
                            ToDoTile("Очень-очень-очень длинная таска"),
                            ToDoTile("Очень-очень-очень длинная таска"),
                            ToDoTile("Очень-очень-очень длинная таска"),
                            ToDoTile("Очень-очень-очень длинная таска"),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(button),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: add,
                ),
                child: Icon(
                  Icons.add,
                  size: button,
                  color: tileback_light,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
