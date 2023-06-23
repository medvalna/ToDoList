part of 'todo_bloc.dart';

@immutable
class TileListState {
  List<ToDo> tileList;
  int doneItems;
  bool showDone;

  TileListState({
    required this.tileList,
    required this.showDone,
    required this.doneItems,
  });

}

class TileListInitial extends TileListState {
  TileListInitial(
      {required List<ToDo> tileList, required doneItems, required showDone})
      : super(tileList: tileList, doneItems: doneItems, showDone: showDone);
}

class TileListUpdated extends TileListState {
  TileListUpdated({required List<ToDo> tileList, required doneItems, required showDone})
      : super(tileList: tileList, doneItems: doneItems, showDone: showDone);
}
