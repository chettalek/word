import 'package:flutter/material.dart';

class scoreclassPage extends StatefulWidget {
  const scoreclassPage({super.key});

  @override
  State<scoreclassPage> createState() => _scoreclassState();
}

class _scoreclassState extends State<scoreclassPage> {
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
        body: Center(
          child: Column(
            children: [
              Container(
                height: 38,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 185, 103),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Center(
                    child: Text(
                  'ระดับชั้นประถมการศึกษาปีที่ 1',
                  style: TextStyle(fontSize: 22),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('อันดับ'),
                  SizedBox(
                    width: 70,
                  ),
                  Text('ชื่อ'),
                  SizedBox(
                    width: 120,
                  ),
                  Text('จำนวนข้อที่ถูก'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 200, 134),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'lek',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      '12/20',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 200, 134),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'pop',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      '9/20',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 200, 134),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'kk',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      '19/20',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 200, 134),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '4',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      'jrr',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text(
                      '20/20',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
