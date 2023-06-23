import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/ui/header.dart';


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
          color: backLight,
        ),
        Positioned(
          top: 160,
          left: 60,
          right: 20,
          child: buildExpandedAppBar(shrinkOffset),
        ),
        Positioned(
          child: buildCollapsedAppBar(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;
  Widget buildCollapsedAppBar(double shrinkOffset) => Opacity(

        opacity: appear(shrinkOffset),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: separator,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.0),
            ],
            color: backLight,
          ),
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.only(top: 35, right: 25, left: 20),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Мои дела",
                  style: TextStyle(color: mainText, fontSize: largeTitle),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildExpandedAppBar(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Container(
          color: backLight,
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Мои дела",
                      style: TextStyle(color: mainText, fontSize: largeTitle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Header(doneCount: doneCount),
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
