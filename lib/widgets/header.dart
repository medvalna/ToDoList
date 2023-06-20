import 'package:flutter/hosted/pub.dev/flutter_bloc-8.1.3/lib/flutter_bloc.dart';
import 'package:flutter/hosted/pub.dev/provider-6.0.5/test/null_safe/inherited_provider_test.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/widgets/tasklist.dart';

import '../bloc/todo_bloc.dart';
import '../main.dart';
import '../models/todocollection.dart';

/*
*
*   - ToDoTile - прорисовка листа тайлов
*   - getNum() -  подсчёт сделанных задач
* */
class Header extends StatelessWidget {
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
                  _countDone(),
                  style: TextStyle(fontSize: body, color: secondarytext),
                ),
              ),
              new Spacer(),
              Container(
                //TODO место для кнопки раскрытия сделанных тасок
                child: Icon(
                  Icons.visibility,
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

String _countDone() {
  int count = 0;
  BlocListener<TileListBloc, TileListState>(
    listener: (context, state) {
      List<ToDo> taskList = state.tileList;
      for (ToDo todo in taskList) {
        if (todo.isDone == true) {
          count = count + 1;
        }
      }
    },
  );

  String res = count.toString();
  return res;
}
