part of 'todo_bloc.dart';



abstract class TileListEvents {

}
class AddTile extends TileListEvents {
  final String text;
  final String date;
  final int importance;
  AddTile({required this.text, required this.date, required this.importance});
}
class GetTiles extends TileListEvents {

  GetTiles();
}

class ShowProcessTasks extends TileListEvents {

  ShowProcessTasks();
}
class TappedDone extends TileListEvents {
  final ToDo tile;
  TappedDone({required this.tile});
}

class DeleteTile extends TileListEvents {
  final ToDo tile;
  DeleteTile({required this.tile});
}