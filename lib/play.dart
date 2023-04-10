import 'package:flutter/material.dart';

class playPage extends StatefulWidget {
  const playPage({super.key});

  @override
  State<playPage> createState() => _playPageState();
}

class _playPageState extends State<playPage> {
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
              Image.asset('assets/images/WORD.png'),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {}, //ฟังชั่นการกดปุ่ม
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Play',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        soundCheck();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 185, 103),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Option',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/homestu.png'),
            ],
          ),
        ));
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
