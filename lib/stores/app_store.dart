import 'package:flutter/material.dart';
import 'package:flutter_base_mobx_plugin/stores/base_screen_store.dart';

class AppStore {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  BaseScreenStore baseScreenStore;

  dynamic navigateTo(String path, {isReplace = false, dynamic data}) async {
    if (isReplace) {
      return await navigatorKey.currentState
          .pushReplacementNamed(path, arguments: data);
    } else {
      return await navigatorKey.currentState.pushNamed(path, arguments: data);
    }
  }

  void navigatePop({dynamic data}) {
    navigatorKey.currentState.pop(data);
  }
}
