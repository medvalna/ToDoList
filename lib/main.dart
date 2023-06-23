import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:flutter/cupertino.dart.';
import 'package:to_do_list/pages/welcome_screen.dart';
import 'adaptivity/font_sizes.dart';
import 'bloc/todo_bloc.dart';
import 'dart:io' show Platform;

import 'models/navigation.dart';


var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() => runApp(const MaterialApp(
      home: App(),
    ));

class App extends StatelessWidget {
  static const String title = ' To-do List App ';

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const home = WelcomePage(title: title);
    if (Platform.isIOS) {
      return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => TileListBloc())],
          child: const CupertinoApp(
            theme: CupertinoThemeData(
              scaffoldBackgroundColor: backLight,
              primaryColor: Colors.blue,
            ),
            home: home,
          ));
    } else {
      return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => TileListBloc())],
          child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: backLight,
              primaryColor: Colors.blue,
              textTheme: const TextTheme(
                headlineLarge: TextStyle(fontSize: largeTitle, color: mainText),
                headlineMedium: TextStyle(fontSize: midTitle, color: mainText),
                bodyMedium: TextStyle(fontSize: midTitle, color: secondaryText),
                bodySmall: TextStyle(fontSize: body, color: secondaryText),
              ),
            ),
            home: home,
            navigatorKey: NavigationManager.instance.key,
          ));
    }
  }
}
