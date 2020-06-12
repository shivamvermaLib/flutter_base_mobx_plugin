// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseScreenStore on _BaseScreenStore, Store {
  final _$titleAtom = Atom(name: '_BaseScreenStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$messageAtom = Atom(name: '_BaseScreenStore.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$bottomNavigationIndexAtom =
      Atom(name: '_BaseScreenStore.bottomNavigationIndex');

  @override
  int get bottomNavigationIndex {
    _$bottomNavigationIndexAtom.reportRead();
    return super.bottomNavigationIndex;
  }

  @override
  set bottomNavigationIndex(int value) {
    _$bottomNavigationIndexAtom.reportWrite(value, super.bottomNavigationIndex,
        () {
      super.bottomNavigationIndex = value;
    });
  }

  final _$showAppBarAtom = Atom(name: '_BaseScreenStore.showAppBar');

  @override
  bool get showAppBar {
    _$showAppBarAtom.reportRead();
    return super.showAppBar;
  }

  @override
  set showAppBar(bool value) {
    _$showAppBarAtom.reportWrite(value, super.showAppBar, () {
      super.showAppBar = value;
    });
  }

  final _$listScrollPositionAtom =
      Atom(name: '_BaseScreenStore.listScrollPosition');

  @override
  ObservableMap<String, double> get listScrollPosition {
    _$listScrollPositionAtom.reportRead();
    return super.listScrollPosition;
  }

  @override
  set listScrollPosition(ObservableMap<String, double> value) {
    _$listScrollPositionAtom.reportWrite(value, super.listScrollPosition, () {
      super.listScrollPosition = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
message: ${message},
bottomNavigationIndex: ${bottomNavigationIndex},
showAppBar: ${showAppBar},
listScrollPosition: ${listScrollPosition}
    ''';
  }
}
