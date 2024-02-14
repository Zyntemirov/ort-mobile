import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ort_mobile/app/app.dart';
import 'package:ort_mobile/core/local_storages/hive_boxes/hive_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await RegisterBoxes().registerBoxes();
  runApp(const App());
}
