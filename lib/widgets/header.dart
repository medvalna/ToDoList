import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/data/logic_provider.dart';

class Header extends StatelessWidget {
  final itemNotifier = TileActions();

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
                  itemNotifier.countDoneItems().toString(),
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
