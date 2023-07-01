import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/models/persistence_manager.dart';

import 'package:to_do_list/main.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TileListBloc extends Bloc<TileListEvents, TileListState> {
  TileListBloc()
      : super(TileListState(tileList: [], doneItems: 0, showProccessTiles: true)) {
    on<AddTile>(_addTile);
    on<DeleteTile>(_deleteTile);
    on<TappedDone>(_tappedDone);
    on<GetTiles>(_getTiles);
    on<ShowProcessTasks>(_showProcessTasks);
  }

  _getTiles(GetTiles event, Emitter<TileListState> emit) async {
    state.tileList = await PersistenceManager.db.getAllTodos();
    state.doneItems = countDone(state.tileList);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProccessTiles));
  }
  _showProcessTasks(ShowProcessTasks event, Emitter<TileListState> emit) async {
    loggerNoStack.i('Changing visibility');
    state.showProccessTiles = !state.showProccessTiles;
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProccessTiles));
  }

  _addTile(AddTile event, Emitter<TileListState> emit) async {
    ToDo item = ToDo(
        id: DateTime.now().millisecondsSinceEpoch,
        task: event.text,
        isDone: null, date: event.date);
    state.tileList.add(item);
    await PersistenceManager.db.saveToDo(item);
    emit(TileListUpdated(
        tileList: state.tileList,
        doneItems: state.doneItems,
        showDone: state.showProccessTiles));
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
        showDone: state.showProccessTiles));
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
        showDone: state.showProccessTiles));
  }
}

int countDone (List<ToDo> todos){
  int count = 0;
  for (ToDo todo in todos){
    if (todo.isDone == true){
      count = count +1;
    }
  }
  return count;
}
