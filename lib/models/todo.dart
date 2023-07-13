/*
*класс с объектом  ToDo
* */

import 'dart:convert';

ToDo todotFromJson(String str) {
  final jsonData = json.decode(str);
  return ToDo.fromJsonPersistence(jsonData);
}

String clientToJson(ToDo data) {
  final dyn = data.toJsonPersistence();
  return json.encode(dyn);
}

class ToDo {
  int id;
  String text;
  String importance;
  String date;
  bool? isDone;

  //int createdAt;
  //int changedAt;

  ToDo({
    required this.id,
    required this.text,
    this.isDone,
    required this.date,
    required this.importance,
    //required this.createdAt,
    //     required this.changedAt,
  });

  Map<String, dynamic> toJsonPersistence() {
    return {
      "id": id,
      "task": text,
      "isDone": isDone == null
          ? 10
          : isDone == true
              ? 1
              : 0,
      "date": date,
      "importance": importance,
    };
  }

  factory ToDo.fromJsonPersistence(Map<String, dynamic> json) => ToDo(
        id: int.parse(json["id"]),
        text: json["task"],
        isDone: json["isDone"] == 10
            ? null
            : json["isDone"] == 1
                ? true
                : false,
        date: json["date"],
        importance: json["importance"],
      );

  factory ToDo.fromMapBackend(Map<String, dynamic> map) => ToDo(
        id: map['id'],
        text: map['text'],
        importance: map['importance'],
        date: map['deadline'],
        isDone: map['done'],
        //createdAt: map['created_at'],
        //changedAt: map['changed_at']);
      );

  Map<String, dynamic> toMapBackend() {
    return {
      'id': id,
      'text': text,
      'importance': importance,
      'deadline': date,
      'done': isDone,
      'color': "#FFFFFF",
      'created_at': 0,
      'changed_at': 0,
      'last_updated_by': 1
    };
  }
}
