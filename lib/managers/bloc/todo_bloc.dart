import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/managers/persistence_manager.dart';

import 'package:to_do_list/main.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TileListBloc extends Bloc<TileListEvents, TileListState> {
  TileListBloc()
      : super(
            TileListState(tileList: [], doneItems: 0, showProcessTiles: true)) {
    on<AddTile>(_addTile);
    on<ChangeTile>(_changeTile);
    on<DeleteTile>(_deleteTile);
    on<TappedDone>(_tappedDone);
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

  _addTile(AddTile event, Emitter<TileListState> emit) async {
    ToDo item = ToDo(
        id: DateTime.now().millisecondsSinceEpoch,
        task: event.text,
        isDone: null,
        date: event.date,
        importance: event.importance);
    state.tileList.add(item);
    await PersistenceManager.db.saveToDo(item);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProcessTiles));
  }

  _changeTile(ChangeTile event, Emitter<TileListState> emit) async {
    for (int i = 0; i < state.tileList.length; i++) {
      ToDo item = state.tileList[i];
      if (item.id == event.item.id) {
        item.task = event.text;
        item.date = event.date;
        item.isDone = event.item.isDone;
        item.importance = event.importance;
        await PersistenceManager.db.changeToDo(item);
        break;
      }
    }
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProcessTiles));
  }

  _deleteTile(DeleteTile event, Emitter<TileListState> emit) async {
    if (event.tile.isDone == true) {
      state.doneItems = state.doneItems - 1;
    }
    state.tileList.remove(event.tile);
    await PersistenceManager.db.deleteToDo(event.tile.id);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProcessTiles));
  }

  _tappedDone(TappedDone event, Emitter<TileListState> emit) async {
    if (event.tile.isDone == null) {
      event.tile.isDone = true;
      state.doneItems = state.doneItems + 1;
    } else if (event.tile.isDone == true) {
      event.tile.isDone = false;
      state.doneItems = state.doneItems - 1;
    } else {
      event.tile.isDone = null;
    }
    await PersistenceManager.db.changeToDo(event.tile);
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
