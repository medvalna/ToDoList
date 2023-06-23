import 'package:flutter/foundation.dart';
import 'package:flutter/hosted/pub.dev/flutter_bloc-8.1.3/lib/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/pages/Homepage.dart';
import 'package:flutter/cupertino.dart.';
import 'package:to_do_list/pages/welcomeScreen.dart';
import 'adaptivity/font_sizes.dart';
import 'bloc/todo_bloc.dart';
import 'dart:io' show Platform;

import 'models/navigation.dart';

void main() => runApp(MaterialApp(
      home: App(),
    ));

class App extends StatelessWidget {
  static const String title = ' To-do List App ';

  @override
  Widget build(BuildContext context) {
    const home = WelcomePage(title: title);
    /*if (Platform.isIOS) {
      return CupertinoApp(
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: back_light,
          primaryColor: Colors.blue,
        ),
        home: Homepage(),
      );
    } else {*/
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => TileListBloc())],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: back_light,
            primaryColor: Colors.blue,
            textTheme: TextTheme(
              headlineLarge: TextStyle(fontSize: largetitle, color: maintext),
              headlineMedium: TextStyle(fontSize: midtitle, color: maintext),
              bodyMedium: TextStyle(fontSize: midtitle, color: secondarytext),
            ),
          ),
          home: home,
          navigatorKey: NavigationManager.instance.key,
        ));
  }
}
