import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/bloc/todo_bloc.dart';
import 'dart:io' show Platform;
import 'package:to_do_list/models/navigation.dart';

import 'package:to_do_list/main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.title});

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => NavigationManager.instance.openHome(widget.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<TileListBloc>().add(ShowTiles());
    loggerNoStack.i('On welcome screen');
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
          child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to ',
                style: TextStyle(fontSize: largeTitle, color: mainText),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: const TextStyle(fontSize: largeTitle, color: mainText),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ));
    } else {
      return Scaffold(
          body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: const LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ));
    }
  }
}
