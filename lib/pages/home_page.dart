import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/managers/bloc/todo_bloc.dart';
import 'package:to_do_list/widgets/add_button.dart';
import 'package:to_do_list/widgets/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_list/main.dart';
import 'package:to_do_list/widgets/appBar.dart';

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
          if (state is TileListUpdated && state.tileList.isNotEmpty) {
            final tileList = state.tileList;
            final tileCount = state.doneItems;
            bool showUndone = state.showProcessTiles;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    CustomAppBar(showUndone: showUndone,doneCount: tileCount ),
                    TaskList(
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
                Container(
                  color: backLight,
                  padding: const EdgeInsets.only(top: 160, right: 20, left: 60),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).myTasks,
                            style: const TextStyle(
                                color: mainText, fontSize: largeTitle),
                          ),
                        ),
                        const Icon(
                          Icons.visibility,
                          color: add,
                        ),
                      ],
                    ),
                  ),
                ),
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
