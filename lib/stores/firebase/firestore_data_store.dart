import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_base_mobx_plugin/stores/firebase/model/firebase_data.dart';

abstract class FireStoreDataStore<T extends FirebaseData> {
  final CollectionReference collectionReference;

  FireStoreDataStore(this.collectionReference) {
    assert(collectionReference != null);
  }

  Future<T> addUpdateItem(T item) async {
    if (item.id == null) {
      item.id = collectionReference.document().documentID;
      item.created = DateTime.now();
    } else {
      item.updated = DateTime.now();
    }
    await collectionReference.document(item.id).setData(JsonMapper.toMap(item));
    return item;
  }

  Future<void> deleteItem(String id) async {
    assert(id != null);
    await collectionReference.document(id).delete();
  }

  Future<T> getItem(String id) async {
    assert(id != null);
    final snapshot = await collectionReference.document(id).get();
    T item = JsonMapper.fromMap(snapshot.data);
    return item;
  }

  Future<List<T>> fetchItemsWhere(
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
  }) async {
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
      return list.documents.map<T>((e) => JsonMapper.fromMap(e.data)).toList();
    } catch (e) {
      return <T>[];
    }
  }

  Future<List<T>> fetchItems(List<String> ids) async {
    assert(ids != null && ids.isNotEmpty);
    final List<T> list =
        await fetchItemsWhere(FieldPath.documentId, whereIn: ids);
    return list;
  }

  Future<List<T>> fetchAllItems() async {
    final list = await collectionReference.getDocuments();
    return list.documents.map<T>((e) => JsonMapper.fromMap(e.data)).toList();
  }
}
