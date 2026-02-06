import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_controller_provider.g.dart';

@riverpod
PageController pageController(Ref ref) {
  return PageController();
}
