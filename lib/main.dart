import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/play.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_application_1/name.dart';
import 'package:flutter_application_1/howtoplay.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/scoreview.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  runApp(MyApp(
    email: email ?? "",
  ));
}

//สร้าง Widget
class MyApp extends StatelessWidget {
  final String email;
  const MyApp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: (email.isNotEmpty) ? playPage() : signinPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
