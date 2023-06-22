part of 'todo_bloc.dart';


@immutable
abstract class TileListEvents {

}
class AddTile extends TileListEvents {
  final String text;
  AddTile({required this.text});
}
class ShowTiles extends TileListEvents {

  ShowTiles();
}
class ShowOppos extends TileListEvents {

  ShowOppos();
}
class TappedOnCheckbox extends TileListEvents {
  final ToDo tile;
  TappedOnCheckbox({required this.tile});
}
class SlideDecline extends TileListEvents {
  final ToDo tile;
  SlideDecline({required this.tile});
}
class SlideDone extends TileListEvents {
  final ToDo tile;
  SlideDone({required this.tile});
}

class DeleteTile extends TileListEvents {
  final ToDo tile;
  DeleteTile({required this.tile});
}

class ChangeTile extends TileListEvents {
  final ToDo tile;
  ChangeTile({required this.tile});
}