import 'dart:async';

import 'package:flutter/hosted/pub.dev/meta-1.9.1/lib/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/todocollection.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TileListBloc extends Bloc<TileListEvents, TileListState> {
  TileListBloc() : super(TileListState(tileList: [], doneItems: 0)) {
    on<AddTile>(_addTile);
    on<DeleteTile>(_deleteTile);
    on<ChangeTile>(_changeTile);
    on<TappedOnCheckbox>(_tappedOnCheckbox);
    on<SlideDone>(_slideDone);
    on<SlideDecline>(_slideDecline);

  }

  void _addTile(AddTile event, Emitter<TileListState> emit) {
    state.tileList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        toDoText: event.text,
        isDone: null));
    emit(TileListUpdated(tileList: state.tileList, doneItems: state.doneItems));
  }

  void _deleteTile(DeleteTile event, Emitter<TileListState> emit) {
    if(event.tile.isDone ==true){
      state.doneItems = state.doneItems - 1;
    }
    state.tileList.remove(event.tile);
    emit(TileListUpdated(tileList: state.tileList, doneItems: state.doneItems));
  }

  void _tappedOnCheckbox(TappedOnCheckbox event, Emitter<TileListState> emit) {
    if (event.tile.isDone == null) {
      event.tile.isDone = true;
      state.doneItems = state.doneItems + 1;
    } else if (event.tile.isDone == true) {
      event.tile.isDone = false;
      state.doneItems = state.doneItems - 1;
    } else {
      event.tile.isDone = null;
    }
    emit(TileListUpdated(tileList: state.tileList,doneItems: state.doneItems ));
  }

  void _slideDecline(SlideDecline event, Emitter<TileListState> emit) {
    if (event.tile.isDone == true) {
      state.doneItems = state.doneItems - 1;
    }
    event.tile.isDone = false;
    emit(TileListUpdated(tileList: state.tileList, doneItems: state.doneItems));
  }

  void _slideDone(SlideDone event, Emitter<TileListState> emit) {
    if (event.tile.isDone == null) {
      event.tile.isDone = true;
      state.doneItems = state.doneItems + 1;
    } else if (event.tile.isDone == true) {
      event.tile.isDone = null;
      state.doneItems = state.doneItems - 1;
    } else {
      event.tile.isDone = null;
    }
    emit(TileListUpdated(tileList: state.tileList, doneItems: state.doneItems));
  }

  void _changeTile(ChangeTile event, Emitter<TileListState> emit) {
    state.doneItems = 0;
    for (int i = 0; i < state.tileList.length; i++) {
      if (event.tile.id == state.tileList[i].id) {
        state.tileList[i] = event.tile;
        if (state.tileList == true){
          state.doneItems ++;
        }
      }
    }
    emit(TileListUpdated(tileList: state.tileList, doneItems: state.doneItems));
  }
}
