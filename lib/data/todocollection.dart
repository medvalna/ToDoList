
class ToDo{
  String id;
  String toDoText;
  int isDone;
  ToDo({
    this.id,
    this.toDoText,
    this.isDone = 0,
  });
  static List<ToDo> taskcollection(){
    return[
      ToDo(id: '1', toDoText: 'Купить то', isDone: 0),
      ToDo(id: '2', toDoText: 'Купить сё', isDone: 1),
      ToDo(id: '3',  toDoText: 'Купить пятое', isDone: -1),
      ToDo(id: '4', toDoText: 'Купить десятое', isDone: 0),
    ];
  }
}