import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

import '../app_store.dart';
import 'firebase_data.dart';
part 'firebase_data_store.g.dart';

class FirebaseDataStore<T extends FirebaseData> = _FirebaseDataStoreBase<T>
    with _$FirebaseDataStore<T>;

abstract class _FirebaseDataStoreBase<T extends FirebaseData>
    with Store
    implements DataStore<T> {
  final JsonFactory jsonFactory;
  final DatabaseReference databaseReference;
  final AppStore _appStore;

  StreamSubscription<Event> subscriptionChildAdded,
      subscriptionChildChanged,
      subscriptionChildRemoved,
      subscriptionChildMoved;

  _FirebaseDataStoreBase(
      this.databaseReference, this.jsonFactory, this._appStore) {
    subscriptionChildAdded = databaseReference.onChildAdded.listen((event) {
      int index = 0;
      if (event.previousSiblingKey != null) {
        index = _getIndexForKey(event.previousSiblingKey) + 1;
      }
      addInitItem(index, _decodeMap(event.snapshot.value));
    });
    subscriptionChildChanged = databaseReference.onChildChanged.listen((event) {
      int index = _getIndexForKey(event.snapshot.key);
      updateInitItem(index, _decodeMap(event.snapshot.value));
    });
    subscriptionChildRemoved = databaseReference.onChildRemoved.listen((event) {
      int index = _getIndexForKey(event.snapshot.key);
      removeInitItem(index);
    });
    subscriptionChildMoved = databaseReference.onChildMoved.listen((event) {
      int oldIndex = _getIndexForKey(event.snapshot.key);
      removeInitItem(oldIndex);
      int newIndex = event.previousSiblingKey == null
          ? 0
          : _getIndexForKey(event.previousSiblingKey) + 1;
      addInitItem(newIndex, _decodeMap(event.snapshot.value));
    });
  }

  @action
  void addInitItem(int index, T t) {
    t.store = this;
    list.insert(index, t);
  }

  @action
  void updateInitItem(int index, T t) {
    t.store = this;
    if (item?.id == t.id) {
      item = t;
    }

    int searchIndex = searchList.indexWhere((gp) => gp.id == t.id);
    if (searchIndex > -1) {
      searchList[searchIndex] = t;
    }
    list[index] = t;
  }

  @action
  void removeInitItem(int index) {
    T t = list[index];
    if (t != null) {
      if (item?.id == t.id) {
        item = null;
      }
      int searchIndex = searchList.indexWhere((s) => s.id == t.id);
      if (searchIndex > -1) {
        searchList.removeAt(searchIndex);
      }
    }
    list.removeAt(index);
  }

  int _getIndexForKey(String key) {
    int index = list.indexWhere((s) => s.id == key);
    if (index != -1) {
      return index;
    }
    throw Exception("Key not found");
  }

  T _decodeMap<T>(dynamic data) {
    if (data == null) {
      return null;
    }
    Map<String, dynamic> values = Map<String, dynamic>.from(data);
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return null;
    }
    for (var key in values.keys) {
      dynamic value = values[key];
      if (value is Map<dynamic, dynamic>) {
        values[key] = Map<String, dynamic>.from(value);
      }
    }
    return jsonFactory(values)..store = this;
  }

  @observable
  ObservableList<T> list = ObservableList.of([]);
  @observable
  ObservableList<T> searchList = ObservableList();
  @observable
  T item;
  @observable
  bool loading = false;
  @observable
  int searchListEnd = 10;
  @computed
  ObservableList<T> get searchedList =>
      ObservableList.of(searchList.take(searchListEnd));

  @action
  @override
  Future<T> addUpdateItem(T t) async {
    loading = true;
    if (t.id == null) {
      t.id = databaseReference.push().key;
      t.created = DateTime.now().millisecondsSinceEpoch;
    } else {
      t.updated = DateTime.now().millisecondsSinceEpoch;
    }
    await databaseReference.child(t.id).set(t.toJson());
    loading = false;
    t.store = this;
    return t;
  }

  /*
   * Use this method only if you are using item in your screen else use getItem
   */
  @action
  @override
  T fetchItem(String id) {
    if (id == null) {
      throw Exception("Id cannot be Null");
    }
    int index = _getIndexForKey(id);
    T t = list[index];
    t.store = this;
    item = t;
    return t;
  }

  T getItem(String id) {
    if (id == null) {
      throw Exception("Id cannot be Null");
    }
    int index = _getIndexForKey(id);
    T t = list[index];
    t.store = this;
    return t;
  }

  @action
  @override
  List<T> searchListItems(bool Function(T) checkWhere) {
    searchList.clear();
    searchListEnd = 10;
    searchList.addAll(list.where(checkWhere).map((t) {
      t.store = this;
      return t;
    }).toList());
    return searchList.cast<T>();
  }

  @action
  @override
  Future<void> removeItem(String id) async {
    if (id == null) {
      throw Exception("Id cannot be Null");
    }
    loading = true;
    await databaseReference.child(id).remove();
    loading = false;
  }

  @override
  void dispose() async {
    list.clear();
    item = null;
    loading = false;
    await subscriptionChildAdded.cancel();
    await subscriptionChildChanged.cancel();
    await subscriptionChildMoved.cancel();
    await subscriptionChildRemoved.cancel();
  }

  @override
  AppStore get appStore => _appStore;
}

abstract class DataStore<T> {
  Future<void> removeItem(String id);
  T fetchItem(String id);
  Future<T> addUpdateItem(T t);
  List<T> searchListItems(bool Function(T) check);
  void dispose();
  AppStore get appStore;
}

typedef T JsonFactory<T>(Map<String, dynamic> json);
