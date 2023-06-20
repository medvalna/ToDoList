/*
*класс с объектом  ToDo
* */

class ToDo {
  final String id;
  final String toDoText;
  bool? isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    required this.isDone,
  });

  static List<ToDo> taskcollection() {
    return [
      ToDo(id: '1', toDoText: 'Погулять', isDone: false),
      ToDo(id: '2', toDoText: 'Купить мандарины', isDone: null),
      ToDo(id: '3', toDoText: 'Закрыть сессию', isDone: true),
      ToDo(id: '4', toDoText: 'Поехать на второй тур', isDone: null),
      ToDo(id: '5', toDoText: 'Сделать домашку по ШМР', isDone: null),
      ToDo(id: '6', toDoText: 'Сходить в тренажерку', isDone: true),
      ToDo(id: '7', toDoText: 'Погладить кота', isDone: false),
      ToDo(id: '8', toDoText: 'Сделать смешной стикерпак в телегу', isDone: null),
      ToDo(id: '9', toDoText: 'Доделать приложение ToDo-листа', isDone: null),
      ToDo(id: '10', toDoText: 'Прочитать книгу', isDone: false),
    ];
  }
}
