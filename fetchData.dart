// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quiz_app_bloc/models/data_resp/TestModel.dart';


Future<List<TestModel>> readJson() async {
  print('***********************TEST JSON LOAD***********************');
  //final response = await rootBundle.loadString('assets/quest1.json');

  final json = jsonDecode(await rootBundle.loadString("assets/quest1.json"));
  // List<TestModel> data = testModelFromJson2(json);

  final data = testModelFromJson2(json);
return data;
  // print(data[0].question);
  //print(data[0]);
  //final data = await jsonDecode(response) as Map<String, dynamic>;
  //
  // print(data);
  print('***********************TEST JSON LOAD***********************');
  // final data = await jsonDecode(response) as Map<String, dynamic>;
  // var bodyasJson;
  // for (var d in data) {
  //   bodyasJson = DataResp.fromJson(d);
  //   print(bodyasJson);
  // }
  // print(data);
  // final data = jsonDecode(response) as Map<String, dynamic>;
  // print(data);
  //final bodyasJson = DataResp.fromJson(data);
}
