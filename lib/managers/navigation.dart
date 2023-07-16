import 'package:flutter/material.dart';
import 'package:to_do_list/ui/pages/home_page.dart';

import 'package:to_do_list/ui/pages/add_screen.dart';

import '../models/todo.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openHome() {
    _navigator.pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const HomePage();
        },
      ),
    );
  }

  void openAdding(bool editing, ToDo? item) {
    _navigator.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddScreenScoupe(editing: editing, item: item);
        },
      ),
    );
  }

  void pop() {
    _navigator.pop();
  }
}
