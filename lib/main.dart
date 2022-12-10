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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  BeFit(),
    );
  }
}
