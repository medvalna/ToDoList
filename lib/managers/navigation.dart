import 'package:flutter/material.dart';
import 'package:to_do_list/ui/pages/home_page.dart';

import 'package:to_do_list/ui/pages/add_screen.dart';

import 'package:to_do_list/models/todo.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openHome() {
    _navigator.pushReplacement(
      PageRouteBuilder<SlideTransition>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween =
              Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
          var curveTween = CurveTween(curve: Curves.ease);

          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void openAdding(bool editing, ToDo? item) {
    _navigator.push(
      PageRouteBuilder<SlideTransition>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddScreenScoupe(editing: editing, item: item),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween =
              Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
          var curveTween = CurveTween(curve: Curves.ease);

          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void pop() {
    _navigator.pop();
  }
}
