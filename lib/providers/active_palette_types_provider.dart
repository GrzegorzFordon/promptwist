import 'package:promptwist/models/palette_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_palette_types_provider.g.dart';

@riverpod
class ActivePaletteTypes extends _$ActivePaletteTypes {
  @override
  List<PaletteType> build() {
    return PaletteType.values;
  }

  void add(PaletteType type) => state.contains(type) ? null : state = state?..add(type);
  void remove(PaletteType type)=>state.remove(type);
}
