import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/ui/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final int doneCount;
  final bool showUndone;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.doneCount,
    required this.showUndone,
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
          child: buildExpandedAppBar(shrinkOffset, context),
        ),
        Positioned(
          child: buildCollapsedAppBar(shrinkOffset, context),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildCollapsedAppBar(double shrinkOffset, context) => Opacity(
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
              Expanded(
                child: Text(
                  AppLocalizations.of(context).myTasks,
                  style: const TextStyle(color: mainText, fontSize: largeTitle),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: showUndone == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    _changeVisibility();
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildExpandedAppBar(double shrinkOffset, context) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Container(
          color: backLight,
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).myTasks,
                      style: const TextStyle(color: mainText, fontSize: largeTitle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: showUndone == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        _changeVisibility();
                      },
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

void _changeVisibility() {
  //context.read<TileListBloc>().add(ShowProcessTasks());
}
