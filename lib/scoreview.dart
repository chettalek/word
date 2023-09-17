import 'dart:convert';

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
  void getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Fullname = prefs.getString('name') ?? "";
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
    getname();
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
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 2',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 3',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 4',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
                    'ระดับชั้นประถมการศึกษาปีที่ 5',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
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
}
