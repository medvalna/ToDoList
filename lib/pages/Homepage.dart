import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';
import 'package:to_do_list/widgets/addbutton.dart';
import 'package:to_do_list/widgets/header.dart';
import 'package:to_do_list/widgets/tasklist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/appBar.dart';

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
  @override
  Widget build(
          BuildContext
              context) => /*{
    if (Platform.isIOS){
      return CupertinoPageScaffold(
          backgroundColor: back_light,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: CustomSliverAppBarDelegate(expandedHeight: 160),
                    pinned: true,
                  ),
                  TaskList(),
                ],
              ),
              AddButton(),
            ],
          ),
        );
    } else {*/
      Scaffold(
        backgroundColor: back_light,
        body: BlocBuilder<TileListBloc, TileListState>(
          builder: (context, state) {
            if (state is TileListUpdated && state.tileList.isNotEmpty) {
              final tileList = state.tileList;
              final tileCount = state.doneItems;
              final showFullList = state.showDone;
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        delegate: CustomSliverAppBarDelegate(
                            expandedHeight: 160, doneCount: tileCount),
                        pinned: true,
                      ),
                      TaskList(tileList, showFullList),
                    ],
                  ),
                  AddButton(),
                ],
              );
            } else {
              return Stack(
                children: [
                  Container(
                    color: back_light,
                    padding: EdgeInsets.only(top: 160, right: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Мои дела",
                              style: TextStyle(
                                  color: maintext, fontSize: largetitle),
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
                  Align(
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


