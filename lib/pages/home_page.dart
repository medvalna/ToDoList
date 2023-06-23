import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';
import 'package:to_do_list/ui/add_button.dart';
import 'package:to_do_list/ui/task_list.dart';
import 'package:to_do_list/ui/app_bar.dart';

import '../main.dart';

/*
* UI главной страницы:
*    - itemNotifier - вызов глобального состояния
*     через ChangeNotifier (он прописан в /data/logic_provider)
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
    context.read<TileListBloc>().add(ShowTiles());
    return Scaffold(
      backgroundColor: backLight,
      body: BlocBuilder<TileListBloc, TileListState>(
        builder: (context, state) {
          if (state is TileListUpdated && state.tileList.isNotEmpty) {
            final tileList = state.tileList;
            final tileCount = state.doneItems;
            //final showFullList = state.showDone;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: CustomSliverAppBarDelegate(
                          expandedHeight: 160, doneCount: tileCount),
                      pinned: true,
                    ),
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
                  padding: const EdgeInsets.only(top: 160, right: 20, left: 20),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Мои дела",
                            style: TextStyle(
                                color: mainText, fontSize: largeTitle),
                          ),
                        ),
                        Icon(
                          Icons.visibility_off,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Добавь новую задачу!",
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
