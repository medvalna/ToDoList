import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/managers/tile_list_bloc/tile_list_bloc.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/managers/persistence_manager.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TileBloc extends Bloc<TileEvents, TileState> {
  final TileListBloc tileListBloc;

  TileBloc(this.tileListBloc)
      : super(TileState(
            tile: ToDo(
              id: 0,
              text: "",
              date: '',
              importance: '',
            ),
            diff: 0,
            toAdd: null,
            toDelete: null)) {
    on<DeleteTile>(_deleteTile);
    on<AddTile>(_addTile);
    on<ChangeTile>(_changeTile);
    on<TappedDone>(_tappedDone);
  }

  _deleteTile(DeleteTile event, Emitter<TileState> emit) async {
    if (event.tile.isDone == true) {
      state.diff = state.diff - 1;
    }
    state.toDelete = true;
    //state.tileList.remove(event.tile);
    await PersistenceManager.db.deleteToDo(event.tile.id);
    emit(TileUpdated(
        tile: state.tile,
        toAdd: null,
        toDelete: state.toDelete,
        diff: state.diff));
    tileListBloc.add(GetTiles());
  }

  _addTile(AddTile event, Emitter<TileState> emit) async {
    ToDo item = ToDo(
        id: DateTime.now().millisecondsSinceEpoch,
        text: event.text,
        isDone: null,
        date: event.date,
        importance: event.importance);
    //state.tileList.add(item);
    await PersistenceManager.db.saveToDo(item);
    emit(TileUpdated(
        tile: state.tile,
        toAdd: state.toDelete,
        toDelete: null,
        diff: state.diff));
    tileListBloc.add(GetTiles());
  }

  _changeTile(ChangeTile event, Emitter<TileState> emit) async {
    event.item.text = event.text;
    event.item.date = event.date;
    event.item.importance = event.importance;
    await PersistenceManager.db.changeToDo(event.item);

    emit(TileUpdated(
        tile: state.tile,
        toAdd: state.toDelete,
        toDelete: null,
        diff: state.diff));
    tileListBloc.add(GetTiles());
  }

  _tappedDone(TappedDone event, Emitter<TileState> emit) async {
    if (event.tile.isDone == null) {
      event.tile.isDone = true;
      state.diff = state.diff + 1;
    } else if (event.tile.isDone == true) {
      event.tile.isDone = false;
      state.diff = state.diff - 1;
    } else {
      event.tile.isDone = null;
    }
    await PersistenceManager.db.changeToDo(event.tile);
    emit(TileUpdated(
        tile: state.tile,
        toAdd: null,
        toDelete: state.toDelete,
        diff: state.diff));
    tileListBloc.add(GetTiles());
  }
}
