import 'package:flutter/hosted/pub.dev/flutter_bloc-8.1.3/lib/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

import '../bloc/todo_bloc.dart';
import '../main.dart';
import '../models/todo.dart';

/*
*
*   - ToDoTile - прорисовка листа тайлов
*   - getNum() -  подсчёт сделанных задач
* */

class Header extends StatelessWidget {
  final int doneCount;

  const Header({

    required this.doneCount,
  });


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
                  doneCount.toString(),
                  style: TextStyle(fontSize: body, color: secondarytext),
                ),
              ),
              new Spacer(),
              Container(
                //TODO место для кнопки раскрытия сделанных тасок
                child: IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {

                  },
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