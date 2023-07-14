import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:to_do_list/data/colours.dart';
import 'package:to_do_list/ui/pages/welcome_screen.dart';
import 'package:to_do_list/data/font_sizes.dart';
import 'package:to_do_list/managers/tile_bloc/todo_bloc.dart';
import 'package:to_do_list/managers/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'managers/tile_bloc/todo_bloc.dart';
import 'managers/tile_list_bloc/tile_list_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

const _kShouldTestAsyncErrorOnInit = false;

// Toggle this for testing Crashlytics in your app locally.
const _kTestingCrashlytics = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    // If you wish to record a "non-fatal" exception, please use `FirebaseCrashlytics.instance.recordFlutterError` instead
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const home = WelcomePage();
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => TileListBloc())],
        child: MaterialApp(
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            scaffoldBackgroundColor: backLight,
            textTheme: const TextTheme(
              headlineLarge: TextStyle(fontSize: largeTitle, color: mainText),
              headlineMedium: TextStyle(fontSize: midTitle, color: mainText),
              bodyMedium: TextStyle(fontSize: button, color: secondaryText),
              bodySmall: TextStyle(fontSize: body, color: secondaryText),
            ),
          ),
          home: home,
          navigatorKey: NavigationManager.instance.key,
        ));
  }
}
