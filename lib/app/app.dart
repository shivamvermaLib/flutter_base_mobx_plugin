import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';

import 'screens.dart';
import 'translations_delegate_base.dart';

abstract class BaseApp extends StatelessWidget implements ScreenDelegate {
  // final _appStore = AppStore();
  TranslationBase get translationBase;
  final providers = <Store>[
    NavigationStore(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: providers,
      child: Observer(
        builder: (BuildContext context) {
          ThemeStore _themeStore = StoreProvider.of<ThemeStore>(context);
          LocalizationStore _localizationStore =
              StoreProvider.of<LocalizationStore>(context);
          NavigationStore _navigationStore =
              StoreProvider.of<NavigationStore>(context);
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: _themeStore?.statusBarColor ?? Colors.blue,
          ));
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeStore?.themeData,
            // darkTheme: ,
            navigatorKey: _navigationStore.navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: initialScreen,
            locale: _localizationStore?.appLocal,
            localizationsDelegates: [
              TranslationBaseDelegate(translationBase),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales:
                translationBase?.supportedLocales ?? [const Locale('en')],
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
