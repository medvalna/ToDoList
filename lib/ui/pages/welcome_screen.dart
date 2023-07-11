import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'package:to_do_list/managers/tile_bloc/todo_bloc.dart';
import 'dart:io' show Platform;
import 'package:to_do_list/managers/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_list/main.dart';

import '../../managers/tile_list_bloc/tile_list_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => NavigationManager.instance.openHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<TileListBloc>().add(GetTiles());
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
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context).welcome,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
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
