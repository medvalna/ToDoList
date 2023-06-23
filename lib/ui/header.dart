import 'package:flutter/material.dart';

/*
*
*   - ToDoTile - прорисовка листа тайлов
*   - getNum() -  подсчёт сделанных задач
* */

class Header extends StatelessWidget {
  final int doneCount;

  const Header({
    super.key,
    required this.doneCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Выполнено - ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Text(
                  doneCount.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
