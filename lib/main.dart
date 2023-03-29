import 'package:flutter/material.dart';
import 'package:flutter_application_1/play.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_application_1/name.dart';
import 'package:flutter_application_1/howtoplay.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/question.dart';

void main() {
  runApp(MyApp());
}

//สร้าง Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: const questionPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
