import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/data/todocollection.dart';

class header extends StatefulWidget {
  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  int number;

  final toDosList = ToDo.taskcollection();
  List<ToDo> _currentToDos = [];

  @override
  void initState() {
    _currentToDos = toDosList;
    super.initState();
  }

  int _countDoneItems(_currentToDos) {
    int count = 0;
    print("counting");
    for (ToDo todo in _currentToDos)
      if (todo.isDone > 0) {
        count = count + 1;
      }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Выполнено - ",
                style: TextStyle(fontSize: body, color: secondarytext),
              ),
              //TODO место для количества выполненных тасок
              Expanded(
                child: Text(
                  _countDoneItems(_currentToDos).toString(),
                  style: TextStyle(fontSize: body, color: secondarytext),
                ),
              ),
              new Spacer(),
              Container(
                //TODO место для кнопки раскрытия сделанных тасок
                child: Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
