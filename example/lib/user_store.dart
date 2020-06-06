import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base_mobx_plugin/stores/firebase/firestore_data_store.dart';
import 'package:flutter_base_mobx_plugin/stores/firebase/model/firebase_data.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase extends FireStoreDataStore with Store {
  _UserStoreBase(CollectionReference collectionReference)
      : super(collectionReference);
}

class User extends FirebaseData {}
