import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  Color primaryColor = Colors.blue;
  @observable
  Color primaryDarkColor = Colors.blue;
  @observable
  Color accentColor = Colors.blueAccent;
  @observable
  Color backgroundColor = Colors.white;
  @observable
  Color statusBarColor = Colors.blue;

  @computed
  ThemeData get themeData => ThemeData(
        accentColor: accentColor,
        primaryColor: primaryColor,
        primaryColorDark: primaryDarkColor,
        backgroundColor: backgroundColor,
      );

  @action
  void changeTheme({
    Color primaryColor,
    Color primaryDarkColor,
    Color accentColor,
    Color backgroundColor,
  }) {
    if (primaryColor != null) this.primaryColor = primaryColor;
    if (primaryDarkColor != null) this.primaryDarkColor = primaryDarkColor;
    if (accentColor != null) this.accentColor = accentColor;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
  }
}
