import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/todocollection.dart';

class TileActions extends ChangeNotifier{

  List<ToDo> _items = ToDo.taskcollection();
  ToDo item;
  ToDo getItem(id) {
    for (ToDo todo in _items){
      if (todo.id == id) return todo;
    }

  }

  List<ToDo> getItems() => UnmodifiableListView(_items);

  void slidedone(ToDo item) {
    item.isDone == 0
        ? item.isDone = 1
        : item.isDone == 1 ? item.isDone = 1 : item.isDone = 0;
    notifyListeners();
  }
  void slidedecline(ToDo item) {
    int index = _items.indexOf(item);
    item.isDone == 0
        ? item.isDone = -1
        : item.isDone == 1 ? item.isDone = 0 : item.isDone = -1;
    notifyListeners();
  }
  void icondone(ToDo item){
    item.isDone == 0 ? item.isDone = 1 : item.isDone = 0;
    notifyListeners();
  }
}