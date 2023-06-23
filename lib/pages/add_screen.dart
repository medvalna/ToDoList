import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/models/navigation.dart';

import 'package:to_do_list/main.dart';

/*
* UI страницы добавления:
*   - itemNotifier - вызов глобального состояния
*     через ChangeNotifier (он прописан в /data/logic_provider)
*
* */

class AddScreen extends StatelessWidget {
  final bool _calendar = false;
  final TextEditingController _controller = TextEditingController();

  AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backLight,
        leading: IconButton(
          onPressed: () => {
            _onGoBack(),
          },
          icon: const Icon(
            Icons.clear,
            color: secondaryText,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: backLight,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  child: const Text(
                    'сохранить',
                    style: TextStyle(fontSize: button, color: add),
                  ),
                  onPressed: () => {
                  loggerNoStack.i('Pressed to add new task'),
                        context.read<TileListBloc>().add(AddTile(text: _controller.text)),
                        _onGoBack(),
                      }),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 42, left: 20, right: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: tileBackLight,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: disable,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0),
              ],
            ),
            child: SizedBox(
              height: 96,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 10),
                  border: InputBorder.none,
                  hintText: "Что надо сделать",
                  hintStyle: TextStyle(color: secondaryText, fontSize: body),
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Важность",
                    style: TextStyle(color: mainText, fontSize: body),
                  ),
                ),
                TextField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: disable),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: disable),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Сделать до",
                        style: TextStyle(color: mainText, fontSize: body),
                      ),
                      const Spacer(),
                      Switch.adaptive(
                        value: _calendar,
                        activeColor: add,
                        onChanged: (bool value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: disable,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            padding: const EdgeInsets.all(5),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: secondaryText,
                  ),
                  Text("Удалить",
                      style: TextStyle(color: secondaryText, fontSize: body))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _onGoBack() {
  NavigationManager.instance.pop();
}
