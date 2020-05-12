import 'package:flutter/material.dart';

class AppProvider<T> extends InheritedWidget {
  final T item;

  AppProvider({Key key, @required this.item, @required Widget child})
      : super(key: key, child: child);

  static T of<T>(BuildContext context) {
    AppProvider provider;
    try {
      provider = context.dependOnInheritedWidgetOfExactType<AppProvider<T>>();
    } catch (e) {
      print("Not Get $e");
      provider = context
          .getElementForInheritedWidgetOfExactType<AppProvider<T>>()
          ?.widget;
    }
    return provider?.item;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
