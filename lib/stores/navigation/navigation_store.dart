import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String path,
      {isReplace = false, dynamic data}) async {
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
