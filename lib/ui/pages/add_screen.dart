import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/managers/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/managers/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_list/main.dart';

/*
* UI страницы добавления:
*
* */

/*
* TODO: исправить баг с демонстрацией выбора важности в dropdown widget
*
* */
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}



class _AddScreenState extends State<AddScreen> {

  final TextEditingController _controller = TextEditingController();
  bool _getDate = false;
  late String? dropdownValue;
  String date = "";
  int importance = 0;

  @override
  Future<DateTime?> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    return picked;
  }

  void _changeDate(bool newState) async {
    if (newState == true) {
      final newDate = await _selectDate(context);
      if (newDate != null) {
        final newTaskDate = "${newDate.toLocal()}".split(' ')[0].split('-');
        date = '${newTaskDate[2]}/${(newTaskDate[1])}/${newTaskDate[0]}';
      }
    } else if (newState == false) {
      date = "";
    }
    setState(() {
      _getDate = newState;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<String> list = <String>[AppLocalizations.of(context).no,
      AppLocalizations.of(context).low,
      AppLocalizations.of(context).high];
    dropdownValue = list.first;
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
                  child: Text(
                    AppLocalizations.of(context).save,
                    style: const TextStyle(fontSize: button, color: add),
                  ),
                  onPressed: () => {
                        loggerNoStack.i('Pressed to add new task'),
                        context.read<TileListBloc>().add(AddTile(
                            text: _controller.text,
                            date: date,
                            importance: importance)),
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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context).whatNeeds,
                  hintStyle:
                      const TextStyle(color: secondaryText, fontSize: body),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocalizations.of(context).importance,
                    style: const TextStyle(color: mainText, fontSize: body),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value;
                        value == list[0]
                            ? importance = 0
                            : value == list[1]
                                ? importance = 1
                                : importance = 2;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: body),
                        ),
                      );
                    }).toList(),
                  )),
                ),
                const Divider(
                  color: disable,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
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
                      Column(
                        children: [
                          Text(
                            AppLocalizations.of(context).deadline,
                            style: const TextStyle(
                                color: mainText, fontSize: body),
                          ),
                          Text(
                            date,
                            style:
                                const TextStyle(color: add, fontSize: subhead),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Switch.adaptive(
                        value: _getDate,
                        activeColor: add,
                        onChanged: _changeDate,
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
            margin:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: secondaryText,
                  ),
                  Text(AppLocalizations.of(context).delete,
                      style:
                          const TextStyle(color: secondaryText, fontSize: body))
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
