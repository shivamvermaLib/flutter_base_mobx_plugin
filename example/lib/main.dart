import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/app/app.dart';
import 'package:flutter_base_mobx_plugin/app/translations_delegate_base.dart';
import 'package:flutter_base_mobx_plugin_example/app_translation.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}

enum Screens {
  SPLASH,
  LOGIN,
  REGISTER,
  HOME,
}

class MyApp extends BaseApp {
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
      // screen = HomeScreen();
    }
    return screen;
  }

  @override
  String get initialScreen => Screens.SPLASH.toString();

  @override
  PageTransitionType pageTransitionType(RouteSettings settings) => null;

  @override
  TranslationBase get translationBase => AppTranslation();
}
