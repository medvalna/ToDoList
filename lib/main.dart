import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:to_do_list/data/colours.dart';
import 'package:to_do_list/ui/pages/welcome_screen.dart';
import 'package:to_do_list/data/font_sizes.dart';
import 'package:to_do_list/managers/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'managers/tile_list_bloc/tile_list_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:envied/envied.dart';

part 'package:to_do_list/envied/env2.g.dart';

@Envied(path: '.env')
@EnviedField(varName: 'appMetricaKey')
var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  AppMetrica.activate(const AppMetricaConfig(_Env.appMetricaKey));
  runApp(const App());
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
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: backLight,
            cardColor: tileBackLight,
            secondaryHeaderColor: secondaryText,
            disabledColor: mainText,
            dividerColor: dividerDark,
            textTheme: const TextTheme(
              headlineLarge: TextStyle(fontSize: largeTitle, color: mainText),
              headlineMedium: TextStyle(fontSize: midTitle, color: mainText),
              bodyMedium: TextStyle(fontSize: button, color: secondaryText),
              bodySmall: TextStyle(fontSize: body, color: secondaryText),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: backDark,
            secondaryHeaderColor: secondaryText,
            disabledColor: white,
            cardColor: tileBackDark,
            dividerColor: dividerDark,
            textTheme: const TextTheme(
              headlineLarge: TextStyle(fontSize: largeTitle, color: white),
              headlineMedium: TextStyle(fontSize: midTitle, color: white),
              bodyMedium: TextStyle(fontSize: button, color: white),
              bodySmall: TextStyle(fontSize: body, color: white),
            ),
            /* dark theme settings */
          ),
          themeMode: ThemeMode.system,
          /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
          home: home,
          navigatorKey: NavigationManager.instance.key,
        ));
  }
}
