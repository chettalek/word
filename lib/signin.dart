import 'package:flutter/material.dart';

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
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
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Image.asset('assets/images/word1.png'),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("plakek"); //ใส่ตัวลิ้งไปล็อคอิน gmail
                    },
                    child: SizedBox(
                        height: 50,
                        width: 250,
                        child: Image.asset('assets/images/signin.jpg')),
                  ),
                ],
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
  }
}
