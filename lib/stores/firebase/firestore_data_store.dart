import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_base_mobx_plugin/stores/firebase/model/firebase_data.dart';
import 'package:mobx/mobx.dart';
part 'firestore_data_store.g.dart';

class FireStoreDataStore = _FireStoreDataStoreBase with _$FireStoreDataStore;

abstract class _FireStoreDataStoreBase<T extends FirebaseData> with Store {
  final CollectionReference collectionReference;

  _FireStoreDataStoreBase(this.collectionReference) {
    assert(collectionReference != null);
  }

  @action
  ObservableFuture<T> addUpdateItem(T item) {
    return ObservableFuture(Future(() async {
      if (item.id == null) {
        item.id = collectionReference.document().documentID;
        item.created = DateTime.now();
      } else {
        item.updated = DateTime.now();
      }
      await collectionReference
          .document(item.id)
          .setData(JsonMapper.toMap(item));
      return item;
    }));
  }

  @action
  ObservableFuture<void> deleteItem(String id) {
    assert(id != null);
    return ObservableFuture(Future(() async {
      await collectionReference.document(id).delete();
    }));
  }

  @action
  ObservableFuture<T> getItem(String id) {
    assert(id != null);
    return ObservableFuture(Future(() async {
      final snapshot = await collectionReference.document(id).get();
      T item = JsonMapper.fromMap(snapshot.data);
      return item;
    }));
  }

  @action
  ObservableFuture<List<T>> fetchItemsWhere(
    dynamic field, {
    dynamic isEqualTo,
    dynamic isLessThan,
    dynamic isLessThanOrEqualTo,
    dynamic isGreaterThan,
    dynamic isGreaterThanOrEqualTo,
    dynamic arrayContains,
    List<dynamic> arrayContainsAny,
    List<dynamic> whereIn,
    bool isNull,
  }) {
    return ObservableFuture(Future(() async {
      try {
        final list = await collectionReference
            .where(field,
                isEqualTo: isEqualTo,
                arrayContains: arrayContains,
                arrayContainsAny: arrayContainsAny,
                isGreaterThan: isGreaterThan,
                isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
                isLessThan: isLessThan,
                isLessThanOrEqualTo: isLessThanOrEqualTo,
                isNull: isNull,
                whereIn: whereIn)
            .getDocuments();
        return list.documents
            .map<T>((e) => JsonMapper.fromMap(e.data))
            .toList();
      } catch (e) {
        return <T>[];
      }
    }));
  }

  @action
  ObservableFuture<List<T>> fetchItems(List<String> ids) {
    assert(ids != null && ids.isNotEmpty);
    return ObservableFuture(Future(() async {
      final List<T> list =
          await fetchItemsWhere(FieldPath.documentId, whereIn: ids);
      return list;
    }));
  }

  @action
  ObservableFuture<List<T>> fetchAllItems() {
    return ObservableFuture(Future(() async {
      final list = await collectionReference.getDocuments();
      return list.documents.map<T>((e) => JsonMapper.fromMap(e.data)).toList();
    }));
  }
}
