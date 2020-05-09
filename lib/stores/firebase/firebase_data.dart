import 'package:date_format/date_format.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'firebase_data_store.dart';

part 'firebase_data.g.dart';

/*  
 * Make sure to ovveride the == operator of every model class
 */
@JsonSerializable()
class FirebaseData with Store {
  String id;

  @observable
  int created = DateTime.now().millisecondsSinceEpoch;
  @observable
  int updated;

  @JsonKey(ignore: true)
  @computed
  DateTime get createdDateTime =>
      created != null ? DateTime.fromMillisecondsSinceEpoch(created) : null;

  @computed
  String get createdDateTimeFormat => createdDateTime != null
      ? "${formatDate(createdDateTime, [yyyy, '-', MM, '-', dd])}"
      : "";

  @JsonKey(ignore: true)
  @computed
  DateTime get updatedDateTime =>
      updated != null ? DateTime.fromMillisecondsSinceEpoch(updated) : null;

  @JsonKey(ignore: true)
  DataStore store;

  FirebaseData();

  Future<void> update() async {
    await store.addUpdateItem(this);
  }

  void delete() {
    store.removeItem(id);
  }

  void reset() {
    id = null;
    created = null;
    updated = null;
  }

  static const fromJsonFactory = _$FirebaseDataFromJson;

  factory FirebaseData.fromJson(Map<String, dynamic> json) =>
      _$FirebaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseDataToJson(this);

  @override
  bool operator ==(Object other) =>
      other is FirebaseData &&
      other.id == id &&
      other.created == created &&
      other.updated == updated;

  @override
  int get hashCode => id.hashCode * 31;

  bool mapsEqual(Map m1, Map m2) {
    Iterable k1 = m1.keys;
    Iterable k2 = m2.keys;
    // Compare m1 to m2
    if (k1.length != k2.length) return false;
    for (dynamic o in k1) {
      if (!k2.contains(o)) return false;
      if (m1[o] is Map) {
        if (!(m2[o] is Map)) return false;
        if (!mapsEqual(m1[o], m2[o])) return false;
      } else {
        if (m1[o] != m2[o]) return false;
      }
    }
    return true;
  }
}
