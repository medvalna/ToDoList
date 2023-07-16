import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/data/colours.dart';
import 'package:to_do_list/data/font_sizes.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/managers/tile_bloc/todo_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../data/config_repository.dart';
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
    bool useImportanceColor = ConfigRepository.configRepository.importanceColor;
    loggerNoStack.i("Remote Config send: $useImportanceColor");
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
        color: useImportanceColor
            ? newImportance
            : decline,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: tileBackLight),
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
                  : const Icon(Icons.check_box_outline_blank),
              color: item.isDone == true
                  ? done
                  : item.importance == AppLocalizations.of(context).high
                      ? useImportanceColor
                          ? newImportance
                          : decline
                      : mainText),
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
                          ? Text(
                              "!!",
                              style: TextStyle(
                                  fontSize: body,
                                  color: useImportanceColor
                                      ? newImportance
                                      : decline),
                            )
                          : item.importance == AppLocalizations.of(context).low
                              ? const Icon(
                                  Icons.arrow_downward,
                                  color: secondaryText,
                                )
                              : const Text(""),
                      /*Text(
                        '''${item.text}''',
                        style: TextStyle(
                          fontSize: body,
                          color: item.isDone == true ? secondaryText : mainText,
                          decoration: item.isDone == true
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),*/
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(
                            fontSize: button,
                          ),
                          text: TextSpan(
                              style: TextStyle(
                                color: item.isDone == true
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).disabledColor,
                                decoration: item.isDone == true
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                              text: item.text),
                        ),
                      ),
                    ],
                  ),
                ),
                item.date != ""
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.date,
                          style: TextStyle(
                            fontSize: subhead,
                            color: Theme.of(context).secondaryHeaderColor,
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
            color: Theme.of(context).secondaryHeaderColor,
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
