part of 'todo_bloc.dart';


@immutable
abstract class TileListEvents {

}
class AddTile extends TileListEvents {
  final ToDo todo;
  AddTile({required this.todo});
}
class ShowTiles extends TileListEvents {

  ShowTiles();
}
class TappedDone extends TileListEvents {
  final ToDo tile;
  TappedDone({required this.tile});
}

class DeleteTile extends TileListEvents {
  final ToDo tile;
  DeleteTile({required this.tile});
}