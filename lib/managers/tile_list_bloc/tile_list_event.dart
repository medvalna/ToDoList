part of 'tile_list_bloc.dart';

abstract class TileListEvent {}

class GetTiles extends TileListEvent {
  GetTiles();
}

class ShowProcessTasks extends TileListEvent {
  final bool show;
  ShowProcessTasks({required this.show});
}
