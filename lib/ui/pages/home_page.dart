import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/data/colours.dart';
import 'package:to_do_list/managers/tile_bloc/todo_bloc.dart';
import 'package:to_do_list/ui/widgets/add_button.dart';
import 'package:to_do_list/ui/widgets/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/ui/widgets/app_bar.dart';
import '../../managers/tile_list_bloc/tile_list_bloc.dart';

/*
* UI главной страницы:
*   - CustomSliverAppBarDelegate: кастомный header в сокращенном и обычном формате
*   - header - строка с числом выполненных задач и виджетом раскрытия полной информации
*   - TaskList() - виджет, отвечающий за прорисовку листа тайлов
*   - AddButton - кнопка добавления тайла и переход на страницу добавления
*   - работа с тайлами производится через структуру "TоDo",
*     которая прописана в data/todocollection
*
* */

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i('Try to take todos from database');
    return Scaffold(
      backgroundColor: backLight,
      body: BlocBuilder<TileListBloc, TileListState>(
        builder: (context, state) {
          bool showUndone = state.showProcessTiles;
          final tileCount = state.doneItems;
          if (state is TileListUpdated &&
              state.tileList.isNotEmpty &&
              (!state.showProcessTiles ||
                  state.tileList.length != state.doneItems)) {
            final tileList = state.tileList;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    CustomAppBar(showUndone: showUndone, doneCount: tileCount),
                    TaskList(
                      showUndone: showUndone,
                      tileList, //showFullList
                    ),
                  ],
                ),
                const AddButton(),
              ],
            );
          } else {
            return Stack(
              children: [
                CustomScrollView(slivers: [
                  CustomAppBar(showUndone: showUndone, doneCount: tileCount),
                ]),
                Center(
                  child: Text(
                    AppLocalizations.of(context).addNew,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: AddButton(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
