import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/name.dart';
import 'package:flutter_application_1/play.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      // // 'email',
      // 'https://www.googleapis.com/auth/user.emails.read',
      // 'https://www.googleapis.com/auth/userinfo.email'
    ],
  );

  Future signInWithGoogle() async {
    try {
      googleSignIn.signOut();

      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication userAuth =
            await googleSignInAccount.authentication;

        print(googleSignInAccount.email);
        login(googleSignInAccount.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future login(email) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/mobilelogin.php?username=$email'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        if (post["status"] == true) {
          if (post["name"] != "" &&post["name"] != null) {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString('email', email);
            await prefs.setString('name', post["name"]);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => playPage())),
                (route) => false);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => namePage(email: email,))),
            );
          }
        }
      }
    } catch (error) {
      print(error);
    }
  }

  //แสดงข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Image.asset('assets/images/word1.png'),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                      print("plakek"); //ใส่ตัวลิ้งไปล็อคอิน gmail
                    },
                    child: SizedBox(
                        height: 50,
                        width: 250,
                        child: Image.asset('assets/images/signin.jpg')),
                  ),
                ],
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
  }
}
