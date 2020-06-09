import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class StoreProvider extends InheritedWidget {
  final List<Store> store;

  StoreProvider({Key key, @required this.store, @required Widget child})
      : super(key: key, child: child);

  static T of<T extends Store>(BuildContext context) {
    StoreProvider provider;
    try {
      provider = context.dependOnInheritedWidgetOfExactType<StoreProvider>();
    } catch (e) {
      // print("Not Get $e");
      provider = context
          .getElementForInheritedWidgetOfExactType<StoreProvider>()
          ?.widget;
    }
    List stores = provider?.store;
    if (stores != null) {
      for (var store in stores) {
        if (store is T) {
          return store;
        }
      }
    }
    return null;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
