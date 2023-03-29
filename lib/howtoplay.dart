import 'package:flutter/material.dart';

class howtoplayPage extends StatefulWidget {
  const howtoplayPage({super.key});

  @override
  State<howtoplayPage> createState() => _howtoplayPageState();
}

class _howtoplayPageState extends State<howtoplayPage> {
  //แสดงข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'วิธีการเล่น',
                  style: TextStyle(fontSize: 30),
                ),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 250,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('1. เลือกหมวดหมู่'),
                            Text('1. เลือกหมวดหมู่'),
                            Text('1. เลือกหมวดหมู่'),
                            Text('1. เลือกหมวดหมู่')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {}, //ฟังชั่นการกดปุ่ม
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 248, 185, 103),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'ตกลง',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ],
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
