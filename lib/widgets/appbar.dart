import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

class appBar extends StatelessWidget {
  final bool tapped;
  const appBar(this.tapped);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: back_light,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 160,
      onStretchTrigger: (){},
      flexibleSpace: Stack(
          children:[
            FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 60),
              title: Text(
                "Мои дела",
                style: TextStyle(color: maintext, fontSize: largetitle),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:50, right:40),
              child: Align(
                alignment: Alignment.topRight,
                //TODO добавить анимацию передвижения виджета глаза
                /*child: Icon(
                  Icons.remove_red_eye,
                ),*/
              ),

            ),
          ]
      ),
    );
  }
}
