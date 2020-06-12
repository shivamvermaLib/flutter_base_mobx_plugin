// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  final _$statusBarColorAtom = Atom(name: '_ThemeStore.statusBarColor');

  @override
  Color get statusBarColor {
    _$statusBarColorAtom.reportRead();
    return super.statusBarColor;
  }

  @override
  set statusBarColor(Color value) {
    _$statusBarColorAtom.reportWrite(value, super.statusBarColor, () {
      super.statusBarColor = value;
    });
  }

  final _$systemNavigationBarColorAtom =
      Atom(name: '_ThemeStore.systemNavigationBarColor');

  @override
  Color get systemNavigationBarColor {
    _$systemNavigationBarColorAtom.reportRead();
    return super.systemNavigationBarColor;
  }

  @override
  set systemNavigationBarColor(Color value) {
    _$systemNavigationBarColorAtom
        .reportWrite(value, super.systemNavigationBarColor, () {
      super.systemNavigationBarColor = value;
    });
  }

  final _$themeDataAtom = Atom(name: '_ThemeStore.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  @override
  String toString() {
    return '''
statusBarColor: ${statusBarColor},
systemNavigationBarColor: ${systemNavigationBarColor},
themeData: ${themeData}
    ''';
  }
}
