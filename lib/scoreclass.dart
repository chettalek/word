import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class scoreclassPage extends StatefulWidget {
  @override
  State<scoreclassPage> createState() => _scoreclassState();
  final int classno;
  final int row;
  const scoreclassPage({super.key, required this.classno, required this.row});
}

class _scoreclassState extends State<scoreclassPage> {
  bool isloading = true;
  List score = [];
  bool click = true;

  Future getscore() async {
    try {
      var response = await http.get(
        Uri.parse('https://apiword.learnlangc.com/getalluser.php?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        print(post);
        List list = post;
        print(list.length);
        for (var i = 0; list.length > i; i++) {
          if (int.parse(list[i]['chap_${widget.classno}']) > widget.row) {
            score.add(list[i]);
          }
          print(score);
        }
        // setState(() {
        //   score = post;
        // });
      }
    } catch (error) {
      print(error);
    }
  }

  String Fullname = "";
  getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      Fullname = prefs.getString('email') ?? "";
      click = prefs.getBool("click") ?? true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getname().then((val) {
      print(Fullname);
      getscore().then((value) {
        setState(() {
          isloading = false;
        });
      });
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
                  'ระดับชั้นประถมการศึกษาปีที่ ${widget.classno}',
                  style: TextStyle(fontSize: 22),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'อันดับ',
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '     ชื่อ',
                          // textAlign: TextAlign.center,
                        )),
                    Expanded(
                        child: Text(
                      'จำนวนข้อที่ถูก',
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: (isloading == true)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: score.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: (score[index]["userName"] ==
                                            Fullname)
                                        ? Colors.green[200]
                                        : Color.fromARGB(255, 255, 200, 134),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${score[index]["fullname"]}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          (widget.classno == 1)
                                              ? '${score[index]["score_1"]}/${widget.row}'
                                              : (widget.classno == 2)
                                                  ? '${score[index]["score_2"]}/${widget.row}'
                                                  : (widget.classno == 3)
                                                      ? '${score[index]["score_3"]}/${widget.row}'
                                                      : (widget.classno == 4)
                                                          ? '${score[index]["score_4"]}/${widget.row}'
                                                          : (widget.classno ==
                                                                  5)
                                                              ? '${score[index]["score_5"]}/${widget.row}'
                                                              : '${score[index]["score_6"]}/${widget.row}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
              // Container(
              //   height: 50,
              //   width: 350,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 200, 134),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10),
              //           bottomRight: Radius.circular(10),
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         '1',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 80,
              //       ),
              //       Text(
              //         'lek',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 140,
              //       ),
              //       Text(
              //         '12/20',
              //         style: TextStyle(fontSize: 18),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 50,
              //   width: 350,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 200, 134),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10),
              //           bottomRight: Radius.circular(10),
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         '2',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 80,
              //       ),
              //       Text(
              //         'pop',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 140,
              //       ),
              //       Text(
              //         '9/20',
              //         style: TextStyle(fontSize: 18),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 50,
              //   width: 350,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 200, 134),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10),
              //           bottomRight: Radius.circular(10),
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         '3',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 80,
              //       ),
              //       Text(
              //         'kk',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 140,
              //       ),
              //       Text(
              //         '19/20',
              //         style: TextStyle(fontSize: 18),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   height: 50,
              //   width: 350,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 255, 200, 134),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10),
              //           bottomRight: Radius.circular(10),
              //           topLeft: Radius.circular(10),
              //           topRight: Radius.circular(10))),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         '4',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 80,
              //       ),
              //       Text(
              //         'jrr',
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       SizedBox(
              //         width: 140,
              //       ),
              //       Text(
              //         '20/20',
              //         style: TextStyle(fontSize: 18),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
