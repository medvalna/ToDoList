import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/widgets/appbar.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/tasklist.dart';

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
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              slivers: [
                appBar(true),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 46,
                    child: header("5"),
                  ),
                ),
                taskList(true),
              ],
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
