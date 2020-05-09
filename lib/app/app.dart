import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'screens.dart';
import 'translations_delegate_base.dart';

abstract class BaseApp extends StatelessWidget implements ScreenDelegate {
  final _appStore = AppStore();
  TranslationBase get translationBase;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (BuildContext context) => AppStore()),
        Provider(create: (BuildContext context) => ThemeStore()),
        Provider(create: (BuildContext context) => LocalizationStore()),
      ],
      child: Observer(
        builder: (BuildContext context) {
          ThemeStore _themeStore = context.watch<ThemeStore>();
          LocalizationStore _localizationStore =
              context.watch<LocalizationStore>();
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: _themeStore.statusBarColor,
          ));
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeStore.themeData,
            navigatorKey: _appStore.navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: initialScreen,
            locale: _localizationStore.appLocal,
            localizationsDelegates: [
              TranslationBaseDelegate(translationBase),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: translationBase.supportedLocales,
            onGenerateRoute: (settings) {
              return PageTransition(
                child: getScreen(settings),
                type: pageTransitionType(settings) ??
                    PageTransitionType.rightToLeft,
              );
            },
          );
        },
      ),
    );
  }
}
