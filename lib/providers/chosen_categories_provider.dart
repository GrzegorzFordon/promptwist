import 'dart:math';

import 'package:promptwist/providers/data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chosen_categories_provider.g.dart';

@Riverpod(keepAlive: true)
class ChosenCategories extends _$ChosenCategories {
  @override
  List<(String, String)> build() {
    return [];
  }

  Future<void> add(String category) async {
    var data = await ref.read(dataProvider.future);
    if (!data.data.keys.contains(category)) return;
    if (state.any((element) => element.$1 == category)) return;
    int rndEntryIndex = Random().nextInt(data.data[category]!.length);
    String rndEntry = data.data[category]![rndEntryIndex];
    state = List.from(state)..add((category, rndEntry));
  }

  Future<void> addRandom(int amount) async {
    var data = await ref.read(dataProvider.future);
    List<int> usedKeys = [];
    for (int i = 0; i < amount; i++) {
      int rnd = Random().nextInt(data.data.keys.length);
      while (usedKeys.contains(rnd)) {
        rnd = Random().nextInt(data.data.keys.length);
      }
      usedKeys.add(rnd);
      String rndCategoryTitle = data.data.keys.toList()[rnd];
      add(rndCategoryTitle);
    }
  }

  Future<void> remove(String category) async {
    state = List.from(state)..removeWhere((element) => element.$1 == category);
  }

  Future<void> roll() async {
    List<(String, String)> newList = [];
    var data = await ref.read(dataProvider.future);

    for ((String, String) entry in state) {
      int rndEntryIndex = Random().nextInt(data.data[entry.$1]!.length);
      String rndEntry = data.data[entry.$1]![rndEntryIndex];
      newList.add((entry.$1, rndEntry));
    }

    state = newList;
  }
}
