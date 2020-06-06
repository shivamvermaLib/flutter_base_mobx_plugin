import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:mobx/mobx.dart';

@jsonSerializable
abstract class FirebaseData with Store {
  String id;

  @observable
  DateTime created = DateTime.now();
  @observable
  DateTime updated;

  FirebaseData();

  void reset() {
    id = null;
    created = null;
    updated = null;
  }

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
