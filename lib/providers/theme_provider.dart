import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ThemeData(
      // brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.grey,
        dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
      ),
      // colorScheme: ColorScheme.dark()
      // colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.grey.shade900),
    );
  }
}
