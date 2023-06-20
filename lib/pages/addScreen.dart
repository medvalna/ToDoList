import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';

import '../models/navigation.dart';
import '../main.dart';

/*
* UI страницы добавления:
*   - itemNotifier - вызов глобального состояния
*     через ChangeNotifier (он прописан в /data/logic_provider)
*
* */
class AddScreen extends StatefulWidget {
  AddScreen({key}) : super();

  @override
  State<StatefulWidget> createState() {
    //TODO implement state

    return AddScreenState();
  }
}

class AddScreenState extends State<AddScreen> {
  bool _calendar = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _calendar = false;
    super.initState();
    itemNotifier.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: back_light,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: back_light,
        leading: IconButton(
          onPressed: () => {
           _onGoBack(),
          },
          icon: const Icon(
            Icons.clear,
            color: secondarytext,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Spacer(),
            SizedBox(
              width: 150,
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: back_light,
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  child: Text(
                    'сохранить',
                    style: TextStyle(fontSize: button, color: add),
                  ),
                  onPressed: () => {
                        itemNotifier.addItem(_controller.text),
                        _onGoBack(),
                      }),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 42, left: 20, right: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: tileback_light,
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
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    border: InputBorder.none,
                    hintText: "Что надо сделать",
                    hintStyle: TextStyle(color: secondarytext, fontSize: body),
                  ),
                ),
              ),
            ),
            Container(
              //color: tileback_light,
              margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Важность",
                      style: TextStyle(color: maintext, fontSize: body),
                    ),
                  ),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
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
              //color: tileback_light,
              margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "Сделать до",
                          style: TextStyle(color: maintext, fontSize: body),
                        ),
                        new Spacer(),
                        Switch.adaptive(
                          value: _calendar,
                          activeColor: add,
                          onChanged: (bool value) {
                            setState(() {
                              _calendar = value;
                              print(_calendar);
                            });
                          },
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
              margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: secondarytext,
                    ),
                    Text("Удалить",
                        style: TextStyle(color: secondarytext, fontSize: body))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onGoBack() {
  NavigationManager.instance.pop();
}
