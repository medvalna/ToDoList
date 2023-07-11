import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/managers/persistence_manager.dart';
import '../../main.dart';
import '../tile_bloc/todo_bloc.dart';
part 'tile_list_event.dart';

part 'tile_list_state.dart';

class TileListBloc extends Bloc<TileListEvent, TileListState> {
  TileListBloc()
      : super(
            TileListState(tileList: [], doneItems: 0, showProcessTiles: true)) {
    on<GetTiles>(_getTiles);
    on<ShowProcessTasks>(_showProcessTasks);

  }
  _getTiles(GetTiles event, Emitter<TileListState> emit) async {
    state.tileList = await PersistenceManager.db.getAllTodos();
    /*TODO add network*/
    state.doneItems = countDone(state.tileList);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProcessTiles));
  }

  _showProcessTasks(ShowProcessTasks event, Emitter<TileListState> emit) async {
    loggerNoStack.i('Changing visibility');
    state.showProcessTiles = !event.show;
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProcessTiles));
  }
}

int countDone(List<ToDo> todos) {
  int count = 0;
  for (ToDo todo in todos) {
    if (todo.isDone == true) {
      count = count + 1;
    }
  }
  return count;
}
