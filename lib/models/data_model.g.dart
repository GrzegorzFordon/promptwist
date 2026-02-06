// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataModel _$DataModelFromJson(Map<String, dynamic> json) => _DataModel(
  data:
      (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const {},
);

Map<String, dynamic> _$DataModelToJson(_DataModel instance) =>
    <String, dynamic>{'data': instance.data};
