import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

class appBar extends StatelessWidget {
  final bool tapped;
  const appBar(this.tapped);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //collapsedHeight: 60,
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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.only(right: 30, top: 50),
                //TODO место для кнопки раскрытия сделанных тасок
                child: Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ),
          ]
      ),
    );
  }
}
