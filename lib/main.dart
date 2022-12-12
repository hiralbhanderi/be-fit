import 'package:befit/be_fit.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  await Hive.openBox('water_goal');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BeFit(),
    );
  }
}
