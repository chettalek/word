import 'dart:convert';
import 'package:flutter_application_1/play.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class namePage extends StatefulWidget {
  @override
  State<namePage> createState() => _namePageState();
  final String email;
  const namePage({super.key, required this.email});
}

class _namePageState extends State<namePage> {
  var yourname = TextEditingController();
  Future updatename(email, name) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/updatename.php?username=$email&fullname=$name'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        if (post["status"] == true) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', email);
          await prefs.setString('name', name);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => playPage())),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(post["message"]),
          ));
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Text(
                    'ใส่ชื่อของคุณ',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your name',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      controller: yourname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            updatename(widget.email, yourname.text);
                          }, //ฟังชั่นการกดปุ่ม
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 248, 185, 103),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'ยืนยัน',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, //ฟังชั่นการกดปุ่ม
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 248, 185, 103),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'ย้อนกลับ',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
  }
}
