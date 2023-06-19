import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/pages/Homepage.dart';
import 'package:flutter/cupertino.dart.';
import 'package:to_do_list/pages/welcomeScreen.dart';
import 'adaptivity/font_sizes.dart';
import 'data/logic_provider.dart';
import 'dart:io' show Platform;

import 'data/navigation.dart';

final itemNotifier = TileActions();

void main() => runApp(MaterialApp(
      home: App(),
    ));

class App extends StatelessWidget {
  static const String title = ' To-do List App ';

  @override
  Widget build(BuildContext context) {
    const home = WelcomePage(title: title);
    if (Platform.isIOS) {
      return CupertinoApp(
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: back_light,
          primaryColor: Colors.blue,
        ),
        home: Homepage(),
      );
    } else {
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: back_light,
          primaryColor: Colors.blue,
          textTheme: TextTheme(
            headlineLarge: TextStyle(fontSize: largetitle, color: maintext),
          ),
        ),
        home: home,
        navigatorKey: NavigationManager.instance.key,
      );
    }
  }
}
