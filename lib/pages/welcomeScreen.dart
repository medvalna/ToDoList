import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/adaptivity/font_sizes.dart';
import 'dart:io' show Platform;
import '../data/navigation.dart';

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
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
          child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ',
                style: TextStyle(fontSize: largetitle, color: maintext),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.title}',
                style: TextStyle(fontSize: largetitle, color: maintext),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: LinearProgressIndicator(),
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
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.title}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ));
    }
  }
}
