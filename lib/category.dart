import 'dart:convert';

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
  getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      user = prefs.getString('email') ?? "";
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
                width: 133,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 232, 207),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Back',
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
              Text(
                'เลือกหมวดหมู่',
                style: TextStyle(fontSize: 28),
              ),
              Text(
                'Choose Category',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {}, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมการศึกษาปีที่ 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {}, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมการศึกษาปีที่ 3',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {}, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมการศึกษาปีที่ 4',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {}, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมการศึกษาปีที่ 5',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {}, //ฟังชั่นการกดปุ่ม
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 185, 103),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'ระดับชั้นประถมการศึกษาปีที่ 6',
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
                            'Confirm',
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
                  'รีเซ็ตเรียบร้อย',
                  style: TextStyle(fontSize: 28),
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
