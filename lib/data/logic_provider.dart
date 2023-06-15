import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/data/todocollection.dart';
import 'package:to_do_list/main.dart';

class TileActions extends ChangeNotifier {
  final List<ToDo> _items = ToDo.taskcollection();
  int getNum() => countDoneItems();

  //подсчет числа сделанных задач
  int countDoneItems() {
    int dones = 0;
    for (ToDo todo in itemNotifier.getItems()) {
      if (todo.isDone == 1) {
        dones = dones + 1;
      }
    }
    return dones;
  }

  List<ToDo> getItems() => UnmodifiableListView(_items);

  //вызываем при сдвиге слайда направо
  void slideDone(ToDo item) {
    if (item.isDone == 0) {
      item.isDone = 1;
    } else if (item.isDone == -1) {
      item.isDone = 0;
    }
    notifyListeners();
  }

  //вызываем при сдвиге слайда налево
  void slideDecline(ToDo item) {
    if (item.isDone == 1) {
    }
    item.isDone = -1;
    notifyListeners();
  }

  //вызываем при нажатии на чекбокс
  void iconDone(ToDo item) {
    if (item.isDone == 0) {
      item.isDone = 1;
    } else if (item.isDone == 1) {
      item.isDone = 0;
    } else {
      item.isDone = 0;
    }
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
}
