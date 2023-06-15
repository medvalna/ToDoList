class ToDo {
  String id;
  String toDoText;
  int isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = 0,
  });

  static List<ToDo> taskcollection() {
    return [
      ToDo(id: '1', toDoText: 'Погулять', isDone: 0),
      ToDo(id: '2', toDoText: 'Купить мандарины', isDone: 1),
      ToDo(id: '3', toDoText: 'Закрыть сессию', isDone: 0),
      ToDo(id: '4', toDoText: 'Поехать на второй тур', isDone: 0),
      ToDo(id: '5', toDoText: 'Сделать домашку по ШМР', isDone: 1),
      ToDo(id: '6', toDoText: 'Сходить в тренажерку', isDone: -1),
      ToDo(id: '7', toDoText: 'Погладить кота', isDone: 0),
      ToDo(id: '8', toDoText: 'Сделать смешной стикерпак в телегу', isDone: 0),
      ToDo(id: '9', toDoText: 'Доделать приложение ToDo-листа', isDone: 1),
      ToDo(id: '10', toDoText: 'Прочитать книгу', isDone: -1),
    ];
  }
}
