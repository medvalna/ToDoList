import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/widgets/todotile.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

class taskList extends StatelessWidget {
  final bool tapped;
  const taskList(this.tapped);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(
                right: 25, left: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: separator,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    spreadRadius: 0.0),
              ],
              borderRadius: BorderRadius.circular(20),
              color: tileback_light,
            ),
            child: Column(
              children: [
                ToDoTile("Купить что-то где-то зачем-то"),
                ToDoTile("Купить что-то"),
                ToDoTile("Очень-очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
                ToDoTile("Очень-очень-очень длинная таска"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
