import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/app/translation.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';

import 'screens.dart';

abstract class BaseApp extends StatelessWidget
    implements ScreenDelegate, TranslationDelegate {
  // final _appStore = AppStore();
  final providers = <Store>[
    NavigationStore(),
    LocalizationStore(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: providers,
      child: Observer(
        builder: (BuildContext context) {
          ThemeStore _themeStore = StoreProvider.of<ThemeStore>(context);
          NavigationStore _navigationStore =
              StoreProvider.of<NavigationStore>(context);
          LocalizationStore localizationStore =
              StoreProvider.of<LocalizationStore>(context);
          final systemTheme = SystemUiOverlayStyle(
            statusBarColor: _themeStore?.statusBarColor ?? Colors.blue,
            systemNavigationBarColor:
                _themeStore?.systemNavigationBarColor ?? Colors.blue,
          );
          SystemChrome.setSystemUIOverlayStyle(systemTheme);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeStore?.themeData,
            locale: localizationStore.appLocal,
            navigatorKey: _navigationStore.navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: initialScreen,
            localizationsDelegates:
                supportTranslation ? localizationDelegates : null,
            supportedLocales: supportTranslation
                ? (supportedLocales ?? [const Locale('en', 'US')])
                : [const Locale('en', 'US')],
            localeResolutionCallback: localeResolutionCallback,
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
