/*
*класс с объектом  ToDo
* */

import 'dart:convert';

ToDo todotFromJson(String str) {
  final jsonData = json.decode(str);
  return ToDo.fromJson(jsonData);
}

String clientToJson(ToDo data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ToDo {
  int id;
  String task;
  bool? isDone;

  ToDo({
    required this.id,
    required this.task,
    this.isDone,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "task": task,
      "isDone": isDone == null
          ? 10
          : isDone == true
              ? 1
              : 0,
    };
  }

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: int.parse(json["id"]),
        task: json["task"],
        isDone: json["isDone"] == 10
            ? null
            : json["isDone"] == 1
                ? true
                : false,
      );
}
