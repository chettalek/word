import 'dart:convert';
import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/scoreclass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class scorePage extends StatefulWidget {
  @override
  State<scorePage> createState() => _scorePageState();

  const scorePage({super.key});
}

class _scorePageState extends State<scorePage> {
  String Fullname = "";
  int row = 0;
  bool click = true;

  getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Fullname = prefs.getString('name') ?? "";
      click = prefs.getBool("click") ?? true;
    });
  }

  Future getrow(classid) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/getrow.php?id_class=$classid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        setState(() {
          row = post["row"] ?? 0;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname().then((value) {
      totalscore();
    });
  }

  //แสดงข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 248, 185, 103),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
                width: 120,
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
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'กลับ',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(1).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 1,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(2).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 2,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(3).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 3,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 3',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(4).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 4,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 4',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(5).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 5,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 5',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getrow(6).then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => scoreclassPage(
                                    row: row,
                                    classno: 6,
                                  )));
                    });
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมศึกษาปีที่ 6',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
  }

//...............................................................เพิ่มแจ้งเตือนเงื่อนไขการดูอันดับคะแนน
  void totalscore() {
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
                  'อันดับคะแนน',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'อันดับคะแนนของผู้เล่นจะแสดงก็ต่อเมื่อตอบคำศัพท์ในบทนั้นๆ ครบทุกข้อ',
                    style: TextStyle(fontSize: 14),
                  ),
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
                      'ตกลง',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
