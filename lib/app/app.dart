import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/navigation/navigation_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'screens_delegate.dart';
import 'translation_delegate.dart';

abstract class BaseApp extends StatelessWidget
    implements ScreenDelegate, TranslationDelegate {
  final _getIt = GetIt.instance;

  BaseApp() {
    _getIt.registerSingleton(NavigationStore());
    _getIt.registerSingleton(LocalizationStore());
  }

  void registerStore<T extends Store>(T store) {
    _getIt.registerSingleton(store);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        ThemeStore _themeStore = _getIt<ThemeStore>();
        NavigationStore _navigationStore = _getIt<NavigationStore>();
        LocalizationStore localizationStore = _getIt<LocalizationStore>();
        final systemTheme = SystemUiOverlayStyle(
          statusBarColor: _themeStore?.statusBarColor ?? Colors.blue,
          systemNavigationBarColor:
              _themeStore?.systemNavigationBarColor ?? Colors.blue,
        );
        SystemChrome.setSystemUIOverlayStyle(systemTheme);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: _themeStore?.themeData ??
              ThemeData(
                primarySwatch: Colors.blue,
              ),
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
            return MaterialPageRoute(
                builder: (BuildContext context) => getScreen(settings),
                settings: settings,
                maintainState: true);
          },
        );
      },
    );
  }
}
