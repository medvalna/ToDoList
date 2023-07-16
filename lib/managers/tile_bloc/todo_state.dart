part of 'todo_bloc.dart';

class TileState {
  ToDo tile;
  bool? toDelete;
  bool? toAdd;
  int diff;

  TileState({
    required this.toAdd,
    required this.toDelete,
    required this.tile,
    required this.diff,
  });
}

class TileUpdated extends TileState {
  TileUpdated({
    required ToDo tile,
    required bool? toAdd,
    required bool? toDelete,
    required int diff,
  }) : super(tile: tile, toAdd: toAdd, toDelete: toDelete, diff: diff);
}
