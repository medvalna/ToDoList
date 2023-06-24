import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

import 'package:to_do_list/pages/add_screen.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;


  void openHome() {
    _navigator.pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const Homepage();
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

