import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/widgets/addbutton.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/tasklist.dart';

import 'data/logic_provider.dart';

/*
* UI главной страницы:
*    - itemNotifier - вызов глобального состояния
*     через ChangeNotifier (он прописан в /data/logic_provider)
*   - CustomSliverAppBarDelegate: кастомный header в сокращенном и обычном формате
*   - header - строка с числом выполненных задач и виджетом раскрытия полной информации
*   - TaskList() - виджет, отвечающий за прорисовку листа тайлов
*   - AddButton - кнопка добавления тайла и переход на страницу добавления
*   - работа с тайлами производится через структуру "TоDo",
*     которая прописана в data/todocollection
*
* */
final itemNotifier = TileActions();

void main() => runApp(MaterialApp(
      home: Homepage(),
    ));

class Homepage extends StatelessWidget {
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
                TaskList(),
              ],
            ),
            AddButton(),
          ],
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
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

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: Container(
          color: back_light,
          margin: EdgeInsets.only(top: 30, right: 20),
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
                child: Text(
                  "Мои дела",
                  style: TextStyle(color: maintext, fontSize: largetitle),
                ),
              ),
              Header(),
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
