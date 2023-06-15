import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/todocollection.dart';

class TileActions extends ChangeNotifier {
  final List<ToDo> _items = ToDo.taskcollection();

  //ToDo item;

  List<ToDo> getItems() => UnmodifiableListView(_items);

  void slideDone(ToDo item) {
    item.isDone == 0
        ? item.isDone = 1
        : item.isDone == 1
            ? item.isDone = 1
            : item.isDone = 0;
    notifyListeners();
  }

  void slideDecline(ToDo item) {
    /*
    item.isDone == 0
        ? item.isDone = -1
        : item.isDone == 1 ? item.isDone = 0 : item.isDone = -1;*/
    item.isDone = -1;
    notifyListeners();
  }

  void iconDone(ToDo item) {
    item.isDone == 0 ? item.isDone = 1 : item.isDone = 0;
    notifyListeners();
  }

  void addItem(String toDo) {
    _items.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        toDoText: toDo,
        isDone: 0));
    for (ToDo todo in _items) {
      print(todo.toDoText);
    }
    notifyListeners();
  }

  int countDoneItems() {
    int count = 0;
    for (ToDo todo in _items) {
      if (todo.isDone > 0) {
        count = count + 1;
      }
    }
    return count;
  }
}
