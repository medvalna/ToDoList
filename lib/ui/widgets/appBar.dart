import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

import 'package:to_do_list/managers/bloc/todo_bloc.dart';

class CustomAppBar extends StatelessWidget {
  final int doneCount;
  bool showUndone;

  CustomAppBar({
    super.key,
    required this.doneCount,
    required this.showUndone,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 164,
      backgroundColor: backLight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 32,/* bottom: 8,*/ top: 10),
            child: Text(
              "${AppLocalizations.of(context).done} ${doneCount.toString()}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        titlePadding: const EdgeInsets.only(
          left: 32,
          right: 30,
          bottom: 16,
          top: 30,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context).myTasks,
              style: const TextStyle(color: mainText, fontSize: largeTitle),
            ),

            Transform.translate(
              offset: const Offset(4, 15),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: showUndone
                    ? const Icon(
                        Icons.visibility,
                        color: add,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: add,
                      ),
                onPressed: () {
                  context.read<TileListBloc>().add(ShowProcessTasks(show: showUndone));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
