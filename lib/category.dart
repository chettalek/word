import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/question.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({super.key});

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  String user = "";
  int row = 0;
  int chap1 = 1;
  int chap2 = 1;
  int chap3 = 1;
  int chap4 = 1;
  int chap5 = 1;
  int chap6 = 1;
  bool click = true;

  getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      user = prefs.getString('email') ?? "";
      click = prefs.getBool("click") ?? true;
    });
  }

  Future getuser(user) async {
    try {
      var response = await http.get(
        Uri.parse('https://apiword.learnlangc.com/getuser.php?username=$user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post[0]["chap_1"]);
        setState(() {
          chap1 = int.parse(post[0]["chap_1"]);
          chap2 = int.parse(post[0]["chap_2"]);
          chap3 = int.parse(post[0]["chap_3"]);
          chap4 = int.parse(post[0]["chap_4"]);
          chap5 = int.parse(post[0]["chap_5"]);
          chap6 = int.parse(post[0]["chap_6"]);
        });
      }
    } catch (error) {
      print(error);
    }
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

  Future reset(classid) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/resetscore.php?id_class=$classid&username=$user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        return post['status'];
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname().then((val) {
      getuser(user);
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
                width: 1,
              ),
              Text(
                'เลือกระดับชั้น',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    (click == true)
                        ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                        : null;
                    getuser(user).then(((value) {
                      getrow(1).then((value) {
                        if (chap1 > row) {
                          replay(1);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 1,
                                        chap_cur: chap1,
                                        user: user,
                                      )));
                        }
                      });
                    }));
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
                    getuser(user).then(((value) {
                      getrow(2).then((value) {
                        if (chap2 > row) {
                          replay(2);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 2,
                                        chap_cur: chap2,
                                        user: user,
                                      ))); //.....................................................อันนี้ลองทำเอง ได้ แต่ไม่รู้ถูกไหม
                        }
                      });
                    }));
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
                    getuser(user).then(((value) {
                      getrow(3).then((value) {
                        if (chap3 > row) {
                          replay(3);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 3,
                                        chap_cur: chap3,
                                        user: user,
                                      ))); //.....................................................อันนี้ลองทำเอง ได้ แต่ไม่รู้ถูกไหม
                        }
                      });
                    }));
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
                    getuser(user).then(((value) {
                      getrow(4).then((value) {
                        if (chap4 > row) {
                          replay(4);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 4,
                                        chap_cur: chap4,
                                        user: user,
                                      ))); //.....................................................อันนี้ลองทำเอง ได้ แต่ไม่รู้ถูกไหม
                        }
                      });
                    }));
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
                    getuser(user).then(((value) {
                      getrow(5).then((value) {
                        if (chap5 > row) {
                          replay(5);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 5,
                                        chap_cur: chap5,
                                        user: user,
                                      ))); //.....................................................อันนี้ลองทำเอง ได้ แต่ไม่รู้ถูกไหม
                        }
                      });
                    }));
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
                    getuser(user).then(((value) {
                      getrow(6).then((value) {
                        if (chap6 > row) {
                          replay(6);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => questionPage(
                                        row: row,
                                        chap: 6,
                                        chap_cur: chap6,
                                        user: user,
                                      ))); //.....................................................อันนี้ลองทำเอง ได้ แต่ไม่รู้ถูกไหม
                        }
                      });
                    }));
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

  void replay(id) {
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
                  'คุณทำครบทุกข้อแล้ว',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'ต้องการเริ่มทำใหม่หรือไม่',
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            reset(id).then((value) {
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              Navigator.pop(context);
                              replaysucces();
                            });
                          }, //ฟังชั่นการกดปุ่ม
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 248, 232, 207),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'ยืนยัน',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            (click == true)
                                ? AudioPlayer()
                                    .play(AssetSource('music/ck.mp3'))
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
                            'ยกเลิก',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  void replaysucces() {
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
                  'เรียบร้อย',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            (click == true)
                                ? AudioPlayer()
                                    .play(AssetSource('music/ck.mp3'))
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
                            'Ok',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
