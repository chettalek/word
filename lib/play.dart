import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
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
  String pic = "";
  bool click = true;
  bool audio = true;
  void getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Fullname = prefs.getString('name') ?? "";
      pic = prefs.getString("pic") ?? "";
      click = prefs.getBool("click") ?? true;
      audio = prefs.getBool("audio") ?? true;
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
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/WORD12.png'),
                Row(
                  children: [
                    SizedBox(
                      width: 215,
                    ),
                    Text(
                      'เกมจับคู่คำศัพท์',
                      style: TextStyle(color: Colors.amber[900]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (pic == "")
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                pic,
                                height: 40,
                              ),
                            ),
                          ),
                    Text(
                      'ยินดีต้อนรับ, $Fullname',
                      style: TextStyle(color: Colors.amber[900], fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
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
                          'เล่น',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
                          soundCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 248, 185, 103),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'ตัวเลือก',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          //showscore();
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
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
                          'คะแนน',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
                          howtoplay();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 248, 185, 103),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'วิธีการเล่น',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => aboutPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 248, 185, 103),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'เกี่ยวกับ',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
                          confirmlogout();
                          // final SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // await prefs.clear();
                          // (click == true)
                          //     ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          //     : null;
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => signinPage())),
                          //     (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 37, 37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'ออกจากระบบ',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/images/homestu.png'),
              ],
            ),
          ),
        ));
  }

  void soundCheck() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, myState) {
              return AlertDialog(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: IconButton(
                                  iconSize: 30,
                                  onPressed: () async {
                                    (click == true)
                                        ? AudioPlayer()
                                            .play(AssetSource('music/ck.mp3'))
                                        : null;
                                    if (click == true) {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('click', false);
                                      myState(() {
                                        click = false;
                                      });
                                    } else {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('click', true);
                                      myState(() {
                                        click = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    (click == true)
                                        ? Icons.volume_up
                                        : Icons.volume_off,
                                    color: Colors.black,
                                    size: 40,
                                  )),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: IconButton(
                                  iconSize: 30,
                                  onPressed: () async {
                                    (click == true)
                                        ? AudioPlayer()
                                            .play(AssetSource('music/ck.mp3'))
                                        : null;
                                    if (audio == true) {
                                      FlameAudio.bgm.stop();

                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('audio', false);
                                      myState(() {
                                        audio = false;
                                      });
                                    } else {
                                      FlameAudio.bgm.play('bg.mp3');
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setBool('audio', true);
                                      myState(() {
                                        audio = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    (audio == true)
                                        ? Icons.music_note
                                        : Icons.music_off,
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
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              Navigator.pop(context);
                            }, //ฟังชั่นการกดปุ่ม
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 232, 207),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'กลับ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ));
            }));
  }

  void howtoplay() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'วิธีการเล่น',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    '1. กดที่ปุ่ม เล่น',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text('2. เลือกระดับชั้นของคำศัพท์',
                      style: TextStyle(fontSize: 18)),
                  Text(
                      '3. เลือกตอบคำศัพท์ให้ตรงกับรูปภาพของโจทย์ หรือตอบโดยการกดที่รูปไมค์เพื่อพูด',
                      style: TextStyle(fontSize: 18)),
                  Text('4. กดที่รูปลำโพงเพื่อฟังเสียงของคำศัพท์ได้',
                      style: TextStyle(fontSize: 18))
                ]),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      Navigator.pop(context);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'กลับ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
              ],
            ),
          )),
    );
  }

  void confirmlogout() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ยืนยันการออกจากระบบ',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () async {
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => signinPage())),
                          (route) => false);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'ตกลง',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      Navigator.pop(context);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'กลับ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
              ],
            ),
          )),
    );
  }
}
