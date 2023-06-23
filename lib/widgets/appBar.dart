import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/widgets/header.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final int doneCount;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.doneCount,
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
                child: IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {

                  },
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
              Header(doneCount: doneCount
              ),
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
