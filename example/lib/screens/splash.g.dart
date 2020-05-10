// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashStore on _SplashStoreBase, Store {
  final _$itemCountAtom = Atom(name: '_SplashStoreBase.itemCount');

  @override
  int get itemCount {
    _$itemCountAtom.context.enforceReadPolicy(_$itemCountAtom);
    _$itemCountAtom.reportObserved();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.context.conditionallyRunInAction(() {
      super.itemCount = value;
      _$itemCountAtom.reportChanged();
    }, _$itemCountAtom, name: '${_$itemCountAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'itemCount: ${itemCount.toString()}';
    return '{$string}';
  }
}
