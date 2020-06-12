// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocalizationStore on _LocalizationStore, Store {
  final _$appLocalAtom = Atom(name: '_LocalizationStore.appLocal');

  @override
  Locale get appLocal {
    _$appLocalAtom.reportRead();
    return super.appLocal;
  }

  @override
  set appLocal(Locale value) {
    _$appLocalAtom.reportWrite(value, super.appLocal, () {
      super.appLocal = value;
    });
  }

  @override
  String toString() {
    return '''
appLocal: ${appLocal}
    ''';
  }
}
