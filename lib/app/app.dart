import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/navigation/navigation_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'screens_delegate.dart';
import 'translation_delegate.dart';

abstract class BaseApp extends StatelessWidget
    implements ScreenDelegate, TranslationDelegate {
  // final _appStore = AppStore();
  List<Store> get providers;

  final _getIt = GetIt.instance;

  BaseApp() {
    _getIt.registerSingleton(NavigationStore());
    providers?.forEach((store) {
      if (!_getIt.isRegistered(instance: store)) {
        _getIt.registerSingleton(store);
      }
    });
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
            return PageTransition(
              child: getScreen(settings),
              type: pageTransitionType(settings) ??
                  PageTransitionType.rightToLeft,
            );
          },
        );
      },
    );
  }
}
