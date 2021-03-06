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
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_BaseScreenStore.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$bottomNavigationIndexAtom =
      Atom(name: '_BaseScreenStore.bottomNavigationIndex');

  @override
  int get bottomNavigationIndex {
    _$bottomNavigationIndexAtom.context
        .enforceReadPolicy(_$bottomNavigationIndexAtom);
    _$bottomNavigationIndexAtom.reportObserved();
    return super.bottomNavigationIndex;
  }

  @override
  set bottomNavigationIndex(int value) {
    _$bottomNavigationIndexAtom.context.conditionallyRunInAction(() {
      super.bottomNavigationIndex = value;
      _$bottomNavigationIndexAtom.reportChanged();
    }, _$bottomNavigationIndexAtom,
        name: '${_$bottomNavigationIndexAtom.name}_set');
  }

  final _$showAppBarAtom = Atom(name: '_BaseScreenStore.showAppBar');

  @override
  bool get showAppBar {
    _$showAppBarAtom.context.enforceReadPolicy(_$showAppBarAtom);
    _$showAppBarAtom.reportObserved();
    return super.showAppBar;
  }

  @override
  set showAppBar(bool value) {
    _$showAppBarAtom.context.conditionallyRunInAction(() {
      super.showAppBar = value;
      _$showAppBarAtom.reportChanged();
    }, _$showAppBarAtom, name: '${_$showAppBarAtom.name}_set');
  }

  final _$listScrollPositionAtom =
      Atom(name: '_BaseScreenStore.listScrollPosition');

  @override
  ObservableMap<String, double> get listScrollPosition {
    _$listScrollPositionAtom.context
        .enforceReadPolicy(_$listScrollPositionAtom);
    _$listScrollPositionAtom.reportObserved();
    return super.listScrollPosition;
  }

  @override
  set listScrollPosition(ObservableMap<String, double> value) {
    _$listScrollPositionAtom.context.conditionallyRunInAction(() {
      super.listScrollPosition = value;
      _$listScrollPositionAtom.reportChanged();
    }, _$listScrollPositionAtom, name: '${_$listScrollPositionAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'title: ${title.toString()},message: ${message.toString()},bottomNavigationIndex: ${bottomNavigationIndex.toString()},showAppBar: ${showAppBar.toString()},listScrollPosition: ${listScrollPosition.toString()}';
    return '{$string}';
  }
}
