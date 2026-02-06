// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palette_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaletteModel _$PaletteModelFromJson(Map<String, dynamic> json) =>
    _PaletteModel(
      colorHexValues:
          (json['colorHexValues'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      paletteType: json['paletteType'] as String? ?? "",
    );

Map<String, dynamic> _$PaletteModelToJson(_PaletteModel instance) =>
    <String, dynamic>{
      'colorHexValues': instance.colorHexValues,
      'paletteType': instance.paletteType,
    };
