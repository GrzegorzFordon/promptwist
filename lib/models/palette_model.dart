import 'package:freezed_annotation/freezed_annotation.dart';

part 'palette_model.freezed.dart';
part 'palette_model.g.dart';

@freezed
abstract class PaletteModel with _$PaletteModel {
  const factory PaletteModel({@Default([]) List<String> colorHexValues, @Default("") String paletteType}) =
      _PaletteModel;

  factory PaletteModel.fromJson(Map<String, dynamic> json) => _$PaletteModelFromJson(json);
}

enum PaletteType { comp, mono, tria, tetr }
