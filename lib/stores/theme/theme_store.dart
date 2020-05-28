import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  Color statusBarColor = Colors.blue;
  @observable
  Color systemNavigationBarColor = Colors.blue;
  @observable
  ThemeData themeData;

  _ThemeStore({this.themeData});
}
