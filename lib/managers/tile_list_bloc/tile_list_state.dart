part of 'tile_list_bloc.dart';

class TileListState {
  List<ToDo> tileList;
  int doneItems;
  bool showProcessTiles;

  TileListState({
    required this.tileList,
    required this.showProcessTiles,
    required this.doneItems,
  });
}

class TileListUpdated extends TileListState {
  TileListUpdated(
      {required List<ToDo> tileList, required doneItems, required showDone})
      : super(
            tileList: tileList,
            doneItems: doneItems,
            showProcessTiles: showDone);
}
