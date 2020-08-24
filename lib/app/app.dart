import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_mobx_plugin/app/store_provider.dart';
import 'package:flutter_base_mobx_plugin/app/translation.dart';
import 'package:flutter_base_mobx_plugin/stores/app_store.dart';
import 'package:flutter_base_mobx_plugin/stores/localization/localization_store.dart';
import 'package:flutter_base_mobx_plugin/stores/theme/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
              return CustomMaterialPageRoute(
                settings: settings,
                builder: (context) => getScreen(settings),
              );
              // return PageRouteBuilder(
              //     settings: settings,
              //     pageBuilder: (BuildContext context,
              //             Animation<double> animation,
              //             Animation<double> secondaryAnimation) =>
              //         getScreen(settings),
              //     transitionDuration: const Duration(milliseconds: 300),
              //     transitionsBuilder: (BuildContext context,
              //         Animation<double> animation,
              //         Animation<double> secondaryAnimation,
              //         Widget child) {
              //       var begin = Offset(1.0, 0.0);
              //       var end = Offset.zero;
              //       var curve = Curves.ease;

              //       var tween = Tween(begin: begin, end: end)
              //           .chain(CurveTween(curve: curve));
              //       return SlideTransition(
              //         position: animation.drive(tween),
              //         child: child,
              //       );
              //     });
            },
          );
        },
      ),
    );
  }
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
