import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/scoreview.dart';
import 'package:flutter_application_1/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class playPage extends StatefulWidget {
  const playPage({super.key});

  @override
  State<playPage> createState() => _playPageState();
}

class _playPageState extends State<playPage> {
  String Fullname = "";
  void getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Fullname = prefs.getString('name') ?? "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname();
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
              Image.asset('assets/images/WORD.png'),
              Text('Welcome $Fullname'),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => categoryPage()));
                      }, //ฟังชั่นการกดปุ่ม
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        soundCheck();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Option',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        //showscore();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => scorePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Score',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        soundCheck();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'How to play',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => signinPage())),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 37, 37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
  }

  void soundCheck() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          icon: Icon(
                            Icons.volume_up,
                            color: Colors.black,
                            size: 40,
                          )),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          icon: Icon(
                            Icons.volume_up,
                            color: Colors.black,
                            size: 40,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )),
    );
  }

  void showscore() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Score',
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Center(child: Text('1'))),
                        Expanded(child: Center(child: Text('Mwd'))),
                        Expanded(child: Center(child: Text('400'))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Center(child: Text('2'))),
                        Expanded(child: Center(child: Text('adw'))),
                        Expanded(child: Center(child: Text('10'))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Center(child: Text('3'))),
                        Expanded(child: Center(child: Text('too'))),
                        Expanded(child: Center(child: Text('340'))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Center(child: Text('4'))),
                        Expanded(child: Center(child: Text('plot'))),
                        Expanded(child: Center(child: Text('90'))),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )),
    );
  }
}
