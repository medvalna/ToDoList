part of 'todo_bloc.dart';

@immutable

class TileListState {
  List<ToDo> tileList;
  int doneItems;

  TileListState({
    required this.tileList,
    required this.doneItems,
  });
}

class TileListInitial extends TileListState {
  TileListInitial({required List<ToDo> tileList,  required doneItems}):super(tileList: tileList, doneItems: doneItems );
}

class TileListUpdated extends TileListState {
  TileListUpdated ({required List<ToDo> tileList, required doneItems}):super(tileList: tileList, doneItems: doneItems);
}