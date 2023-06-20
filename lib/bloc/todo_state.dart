part of 'todo_bloc.dart';

@immutable

class TileListState {
  List<ToDo> tileList;

  TileListState({
    required this.tileList,
  });
}

class TileListInitial extends TileListState {
  TileListInitial({required List<ToDo> tileList}):super(tileList: tileList);
}

class TileListUpdated extends TileListState {
  TileListUpdated ({required List<ToDo> tileList}):super(tileList: tileList);
}