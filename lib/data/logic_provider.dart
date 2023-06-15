import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/todocollection.dart';

class TileActions extends ChangeNotifier {
  final List<ToDo> _items = ToDo.taskcollection();

  List<ToDo> getItems() => UnmodifiableListView(_items);
  //вызываем при сдвиге слайда направо
  void slideDone(ToDo item) {
    item.isDone == 0
        ? item.isDone = 1
        : item.isDone == 1
            ? item.isDone = 1
            : item.isDone = 0;
    notifyListeners();
  }
  //вызываем при сдвиге слайда налево
  void slideDecline(ToDo item) {
    item.isDone = -1;
    notifyListeners();
  }
  //вызываем при нажатии на чекбокс
  void iconDone(ToDo item) {
    item.isDone == 0 ? item.isDone = 1 : item.isDone = 0;
    notifyListeners();
  }
  //добавление задачи в общий список
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
  //подсчет числа сделанных задач
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
