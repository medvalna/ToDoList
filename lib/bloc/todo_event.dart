part of 'todo_bloc.dart';



abstract class TileListEvents {

}
class AddTile extends TileListEvents {
  final String text;
  AddTile({required this.text});
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