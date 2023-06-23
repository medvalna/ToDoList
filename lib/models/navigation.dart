import 'package:flutter/material.dart';
import 'package:to_do_list/pages/Homepage.dart';

import '../pages/addScreen.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;


  void openHome(String title) {
    _navigator.pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Homepage();
        },
      ),
    );
  }

  void openAdding() {
    _navigator.push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddScreen();
        },
      ),
    );
  }

  void pop() {
    _navigator.pop();
  }
}

