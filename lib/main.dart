import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/play.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_application_1/name.dart';
import 'package:flutter_application_1/howtoplay.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/scoreview.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//สร้าง Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: const signinPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
