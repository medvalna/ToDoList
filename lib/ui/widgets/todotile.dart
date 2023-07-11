import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/managers/tile_bloc/todo_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../managers/navigation.dart';
import '../../managers/tile_list_bloc/tile_list_bloc.dart';

class ToDoTileScoupe extends StatelessWidget {
  final ToDo item;

  const ToDoTileScoupe({super.key, required this.item});
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (buildContext) => TileBloc(buildContext.read<TileListBloc>()),
        child: ToDoTile(item),
      );
}

class ToDoTile extends StatelessWidget {
  final ToDo item;

  const ToDoTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          context.read<TileBloc>().add(DeleteTile(tile: item));
        } else {
          context.read<TileBloc>().add(TappedDone(tile: item));
        }
      },
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(left: 10),
        color: done,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.check,
            color: tileBackLight,
          ),
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 10),
        color: decline,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              context.read<TileBloc>().add(TappedDone(tile: item));
            },
            icon: item.isDone == true
                ? const Icon(Icons.check_box)
                : item.isDone == false
                    ? const Icon(Icons.check_box_outline_blank)
                    : const Icon(Icons.check_box_outline_blank),
            color: item.isDone == true
                ? done
                : item.isDone == false
                    ? decline
                    : mainText,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      item.importance == AppLocalizations.of(context).high
                          ? const Text(
                              "!!",
                              style: TextStyle(fontSize: body, color: decline),
                            )
                          : item.importance == AppLocalizations.of(context).low
                              ? const Icon(
                                  Icons.arrow_downward,
                                  color: secondaryText,
                                )
                              : const Text(""),
                      Text(
                        item.text,
                        style: TextStyle(
                          fontSize: body,
                          color: item.isDone == true ? secondaryText : mainText,
                          decoration: item.isDone == true
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                item.date != ""
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.date,
                          style: const TextStyle(
                            fontSize: subhead,
                            color: secondaryText,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(
                        height: 2,
                      ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => {_onOpenAdding(item)},
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  void _onOpenAdding(ToDo item) {
    NavigationManager.instance.openAdding(true, item);
  }
}
