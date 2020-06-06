import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dart_json_mapper_mobx/dart_json_mapper_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/app.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_base_mobx_plugin_example/screens/screen2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';

import 'generated/i18n.dart';
import 'screens/splash.dart';

import 'main.reflectable.dart' show initializeReflectable;

void main() {
  initializeReflectable();
  JsonMapper().useAdapter(mobXAdapter);
  runApp(MyApp());
}

enum Screens {
  SPLASH,
  LOGIN,
  REGISTER,
  HOME,
}

class MyApp extends BaseApp {
  final i18n = I18n.delegate;

  MyApp() {
    registerStore(ThemeStore());
    // registerStore(LocalizationStore());
  }

  @override
  Widget getScreen(RouteSettings settings) {
    Widget screen = Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        "No Screen",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    if (settings.name == Screens.SPLASH.toString()) {
      screen = SplashScreen();
    } else if (settings.name == Screens.LOGIN.toString()) {
      // screen = LoginScreen();
    } else if (settings.name == Screens.REGISTER.toString()) {
      // screen = RegisterScreen();
    } else if (settings.name == Screens.HOME.toString()) {
      screen = Screen2();
    }
    return screen;
  }

  @override
  String get initialScreen => Screens.SPLASH.toString();

  @override
  PageTransitionType pageTransitionType(RouteSettings settings) => null;

  @override
  bool get supportTranslation => true;

  @override
  List<Locale> get supportedLocales => i18n.supportedLocales;

  @override
  List<LocalizationsDelegate> get localizationDelegates => [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Locale Function(Locale locale, Iterable<Locale> locales)
      get localeResolutionCallback =>
          i18n.resolution(fallback: Locale("en", "US"));
}
