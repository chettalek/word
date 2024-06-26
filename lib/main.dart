import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/play.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:flutter_application_1/name.dart';
import 'package:flutter_application_1/howtoplay.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/scoreview.dart';
import 'package:flutter_application_1/scoreclass.dart';
import 'package:flutter_application_1/speechtotext.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_application_1/about.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  bool audio = prefs.getBool("audio") ?? true;

  //
  FlameAudio.bgm.initialize();
  FlameAudio.bgm.stop().then(
      (value) => (audio == true) ? FlameAudio.bgm.play('bg.mp3') : null);

  //
  runApp(MyApp(
    email: email ?? "",
  ));
  // AudioPlayer().stop();
  // AudioPlayer().play(AssetSource('bg.mp3'));
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     print("stop");
  //     //stop your audio player
  //   } else {
  //     print(state.toString());
  //   }
  // }
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
