import 'package:flutter/material.dart';
import 'package:flutter_application_1/scoreclass.dart';

class aboutPage extends StatefulWidget {
  const aboutPage({super.key});

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
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
                    'ย้อนกลับ',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'About',
                  style: TextStyle(fontSize: 30),
                ),
                Column(
                  children: [
                    Container(
                      height: 440,
                      width: 380,
                      color: Color.fromARGB(255, 31, 255, 2),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "1. คำศัพท์ภาษาอังกฤษ จาก คำศัพท์ภาษาอังกฤษพื้นฐานระดับชั้นประถมศึกษา สถาบันภาษาอังกฤษสำนักงานคณะกรรมการการศึกษาขั้นพื้นฐาน กระทรวงศึกษาธิการ",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "2. รูปภาพของโจทย์ จาก www.freepik.com",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "3. package เสียง จาก",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
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
}
