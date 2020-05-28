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
    _$statusBarColorAtom.context.enforceReadPolicy(_$statusBarColorAtom);
    _$statusBarColorAtom.reportObserved();
    return super.statusBarColor;
  }

  @override
  set statusBarColor(Color value) {
    _$statusBarColorAtom.context.conditionallyRunInAction(() {
      super.statusBarColor = value;
      _$statusBarColorAtom.reportChanged();
    }, _$statusBarColorAtom, name: '${_$statusBarColorAtom.name}_set');
  }

  final _$systemNavigationBarColorAtom =
      Atom(name: '_ThemeStore.systemNavigationBarColor');

  @override
  Color get systemNavigationBarColor {
    _$systemNavigationBarColorAtom.context
        .enforceReadPolicy(_$systemNavigationBarColorAtom);
    _$systemNavigationBarColorAtom.reportObserved();
    return super.systemNavigationBarColor;
  }

  @override
  set systemNavigationBarColor(Color value) {
    _$systemNavigationBarColorAtom.context.conditionallyRunInAction(() {
      super.systemNavigationBarColor = value;
      _$systemNavigationBarColorAtom.reportChanged();
    }, _$systemNavigationBarColorAtom,
        name: '${_$systemNavigationBarColorAtom.name}_set');
  }

  final _$themeDataAtom = Atom(name: '_ThemeStore.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.context.enforceReadPolicy(_$themeDataAtom);
    _$themeDataAtom.reportObserved();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.context.conditionallyRunInAction(() {
      super.themeData = value;
      _$themeDataAtom.reportChanged();
    }, _$themeDataAtom, name: '${_$themeDataAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'statusBarColor: ${statusBarColor.toString()},systemNavigationBarColor: ${systemNavigationBarColor.toString()},themeData: ${themeData.toString()}';
    return '{$string}';
  }
}
