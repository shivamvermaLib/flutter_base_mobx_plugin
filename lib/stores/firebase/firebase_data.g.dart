// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseData _$FirebaseDataFromJson(Map<String, dynamic> json) {
  return FirebaseData()
    ..id = json['id'] as String
    ..created = json['created'] as int
    ..updated = json['updated'] as int;
}

Map<String, dynamic> _$FirebaseDataToJson(FirebaseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
    };
