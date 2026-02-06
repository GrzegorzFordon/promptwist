import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:promptwist/models/data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_provider.g.dart';

@riverpod
Future<DataModel> data(Ref ref) async {
  var jsonString = await rootBundle.loadString('assets/data.json');
  Map<String, dynamic> data = jsonDecode(jsonString);
  DataModel model = DataModel.fromJson(data);
  return model;
}

