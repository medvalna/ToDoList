/*
*класс с объектом  ToDo
* */

import 'dart:convert';

class ToDo{
  final String id;
  final String toDoText;
  bool? isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    required this.isDone,
  });

  ToDo fromJson(Map<String, Map<String, bool>> item) {
    //Map<String, Map<String, bool?>> map = {};
    //map = {todo.id: {todo.toDoText: todo.isDone}};
    String id = "";
    String task = "";
    bool? isDone = null;
    for(final element in item.entries){
      id = element.key;
      for(final el in element.value.entries){
        task = el.key;
        isDone = el.value;
      }
    }

    ToDo todo = ToDo(id: id, toDoText: task, isDone: isDone);
    return todo;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'toDoText': toDoText,
      'isDone': isDone,
    };
  }
  @override
  String toString() {
    return 'ToDo{id: $id, toDoText: $toDoText, isDone: $isDone}';
  }

}