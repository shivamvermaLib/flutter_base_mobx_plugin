// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseDataStore<T extends FirebaseData>
    on _FirebaseDataStoreBase<T>, Store {
  Computed<ObservableList<T>> _$searchedListComputed;

  @override
  ObservableList<T> get searchedList => (_$searchedListComputed ??=
          Computed<ObservableList<T>>(() => super.searchedList))
      .value;

  final _$listAtom = Atom(name: '_FirebaseDataStoreBase.list');

  @override
  ObservableList<T> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<T> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$searchListAtom = Atom(name: '_FirebaseDataStoreBase.searchList');

  @override
  ObservableList<T> get searchList {
    _$searchListAtom.context.enforceReadPolicy(_$searchListAtom);
    _$searchListAtom.reportObserved();
    return super.searchList;
  }

  @override
  set searchList(ObservableList<T> value) {
    _$searchListAtom.context.conditionallyRunInAction(() {
      super.searchList = value;
      _$searchListAtom.reportChanged();
    }, _$searchListAtom, name: '${_$searchListAtom.name}_set');
  }

  final _$itemAtom = Atom(name: '_FirebaseDataStoreBase.item');

  @override
  T get item {
    _$itemAtom.context.enforceReadPolicy(_$itemAtom);
    _$itemAtom.reportObserved();
    return super.item;
  }

  @override
  set item(T value) {
    _$itemAtom.context.conditionallyRunInAction(() {
      super.item = value;
      _$itemAtom.reportChanged();
    }, _$itemAtom, name: '${_$itemAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_FirebaseDataStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$searchListEndAtom =
      Atom(name: '_FirebaseDataStoreBase.searchListEnd');

  @override
  int get searchListEnd {
    _$searchListEndAtom.context.enforceReadPolicy(_$searchListEndAtom);
    _$searchListEndAtom.reportObserved();
    return super.searchListEnd;
  }

  @override
  set searchListEnd(int value) {
    _$searchListEndAtom.context.conditionallyRunInAction(() {
      super.searchListEnd = value;
      _$searchListEndAtom.reportChanged();
    }, _$searchListEndAtom, name: '${_$searchListEndAtom.name}_set');
  }

  final _$addUpdateItemAsyncAction = AsyncAction('addUpdateItem');

  @override
  Future<T> addUpdateItem(T t) {
    return _$addUpdateItemAsyncAction.run(() => super.addUpdateItem(t));
  }

  final _$removeItemAsyncAction = AsyncAction('removeItem');

  @override
  Future<void> removeItem(String id) {
    return _$removeItemAsyncAction.run(() => super.removeItem(id));
  }

  final _$_FirebaseDataStoreBaseActionController =
      ActionController(name: '_FirebaseDataStoreBase');

  @override
  void addInitItem(int index, T t) {
    final _$actionInfo = _$_FirebaseDataStoreBaseActionController.startAction();
    try {
      return super.addInitItem(index, t);
    } finally {
      _$_FirebaseDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateInitItem(int index, T t) {
    final _$actionInfo = _$_FirebaseDataStoreBaseActionController.startAction();
    try {
      return super.updateInitItem(index, t);
    } finally {
      _$_FirebaseDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInitItem(int index) {
    final _$actionInfo = _$_FirebaseDataStoreBaseActionController.startAction();
    try {
      return super.removeInitItem(index);
    } finally {
      _$_FirebaseDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  T fetchItem(String id) {
    final _$actionInfo = _$_FirebaseDataStoreBaseActionController.startAction();
    try {
      return super.fetchItem(id);
    } finally {
      _$_FirebaseDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<T> searchListItems(bool Function(T) checkWhere) {
    final _$actionInfo = _$_FirebaseDataStoreBaseActionController.startAction();
    try {
      return super.searchListItems(checkWhere);
    } finally {
      _$_FirebaseDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'list: ${list.toString()},searchList: ${searchList.toString()},item: ${item.toString()},loading: ${loading.toString()},searchListEnd: ${searchListEnd.toString()},searchedList: ${searchedList.toString()}';
    return '{$string}';
  }
}
