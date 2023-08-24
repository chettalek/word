import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';

class questionPage extends StatefulWidget {
  const questionPage({super.key});

  @override
  State<questionPage> createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {
  String pic = "";
  String ans1 = "";
  String ans2 = "";
  String ans3 = "";
  String ans4 = "";
  String anstrue = "";

  bool isloading = true;
  FlutterTts ftts = FlutterTts();
  
  Future getquestion(classid, no) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/getmobilequestion.php?id_class=$classid&no=$no'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        setState(() {
          pic = post[0]["pic"];
          ans1 = post[0]["answer1"];
          ans2 = post[0]["answer2"];
          ans3 = post[0]["answer3"];
          ans4 = post[0]["answer4"];
          anstrue = post[0]["answer_true"];
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
    getquestion(1, 1).then((value) {
      setState(() {
        isloading = false;
      });
    });
  }

  //แสดงข้อมูล
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 185, 103),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 140,
                  ),
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
        body: (isloading==true)?Center(child: CircularProgressIndicator()):Stack(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Image.network(
                                'https://apiword.learnlangc.com/image/$pic')),
                        IconButton(
                            iconSize: 30,
                            onPressed: () async{
                              //your custom configuration
                          await ftts.setLanguage("en-US");
                          await ftts.setSpeechRate(0.5); //speed of speech
                          await ftts.setVolume(1.0); //volume of speech
                          await ftts.setPitch(1); //pitc of sound

                          //play text to sp
                          var result = await ftts.speak("Hello World, this is Flutter Campus.");
                          if(result == 1){
                              //speaking
                          }else{
                              //not speaking
                          }
                            },
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
                                    '$ans1',
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
                                    '$ans2',
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
                                    '$ans3',
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
                                    '$ans4',
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
                    }, //ฟังชั่นการกดปุ่ม กลับหน้าเดิม
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
