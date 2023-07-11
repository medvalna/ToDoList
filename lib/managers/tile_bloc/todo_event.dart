part of 'todo_bloc.dart';

abstract class TileEvents {}

class TappedDone extends TileEvents {
  final ToDo tile;
  TappedDone({required this.tile});
}

class DeleteTile extends TileEvents {
  final ToDo tile;
  DeleteTile({required this.tile});
}

class AddTile extends TileEvents {
  final String text;
  final String date;
  final String importance;
  AddTile({required this.text, required this.date, required this.importance});
}

class ChangeTile extends TileEvents {
  final ToDo item;
  final String text;
  final String date;
  final String importance;
  ChangeTile(
      {required this.item,
      required this.text,
      required this.date,
      required this.importance});
}
