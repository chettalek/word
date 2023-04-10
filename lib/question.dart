import 'dart:ui';

import 'package:flutter/material.dart';

class questionPage extends StatefulWidget {
  const questionPage({super.key});

  @override
  State<questionPage> createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {
  //แสดงข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 185, 103),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 232, 207),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18))),
                child: Center(
                  child: Text(
                    'Score', //รอดึงข้อมุลด่าน
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 232, 207),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: Center(
                      child: Text(
                        '1/155', //รอดึงข้อมุลด่าน
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {
                        showSetting();
                      },
                      icon: Icon(Icons.settings)),
                ],
              ) //ฟังชั่นปุ่ม setting
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/green.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 38,
                      width: 260,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 185, 103),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'ระดับชั้นประถมการศึกษาปีที่ 1',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Image.asset('assets/images/ant.png'),
                        ),
                        IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(Icons.volume_up_outlined)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showPopup();
                        //กดคำตอบ
                      },
                      child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 223, 127),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Ant (แอ็นท) แปลว่า มด',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showPopup();
                        //กดคำตอบ
                      },
                      child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 223, 127),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Ant (แอ็นท) แปลว่า มด',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showPopup();
                        //กดคำตอบ
                      },
                      child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 223, 127),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Ant (แอ็นท) แปลว่า มด',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showPopup();
                        //กดคำตอบ
                      },
                      child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 223, 127),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Ant (แอ็นท) แปลว่า มด',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('cat'),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  void showPopup() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/victory.png'),
                Text(
                  '+5 Score',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 133,
                  child: ElevatedButton(
                    onPressed: () {}, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {}, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Back to menu',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void showSetting() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 40,
                        )),
                  ],
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
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      soundCheck();
                      //กดคำตอบ
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Option',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {}, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Back to menu',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
    );
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
                  height: 15,
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
}
