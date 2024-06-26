import 'dart:convert';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/play.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class questionPage extends StatefulWidget {
  @override
  State<questionPage> createState() => _questionPageState();
  final user;
  final row;
  final chap;
  final chap_cur;
  const questionPage(
      {super.key,
      required this.row,
      required this.chap,
      required this.chap_cur,
      required this.user});
}

class _questionPageState extends State<questionPage> {
  String score = "";
  String pic = "";
  String ans1 = "";
  String ans2 = "";
  String ans3 = "";
  String ans4 = "";
  String anstrue = "";
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

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

  Future updatescore(classid, no, score) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiword.learnlangc.com/updatescore.php?username=${widget.user}&id_class=$classid&score=$score&no=$no'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var post = json.decode(response.body);
        setState(() {
          score = post['score'].toString();
          print(score);
        });
        print(post);
        return post['score'].toString();
      }
    } catch (error) {
      print(error);
    }
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSpeech();
    getquestion(widget.chap, widget.chap_cur).then((value) {
      setState(() {
        isloading = false;
        getname();
      });
    });
  }

  bool click = true;

  void getname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      click = prefs.getBool("click") ?? true;
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
                        '${widget.chap_cur}/${widget.row}', //รอดึงข้อมุลด่าน
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {
                        (click == true)
                            ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                            : null;
                        showSetting();
                      },
                      icon: Icon(Icons.settings)),
                ],
              ) //ฟังชั่นปุ่ม setting
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 248, 232, 207),
        body: (isloading == true)
            ? Center(child: CircularProgressIndicator())
            : Stack(
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
                              'ระดับชั้นประถมศึกษาปีที่ ${widget.chap}',
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
                                  onPressed: () async {
                                    await ftts.setLanguage("en-US");
                                    await ftts
                                        .setSpeechRate(0.5); //speed of speech
                                    await ftts
                                        .setVolume(1.0); //volume of speech
                                    await ftts.setPitch(1); //pitc of sound

                                    //play text to sp
                                    var result = await ftts.speak(anstrue);
                                    print(result);
                                    if (result == 1) {
                                      //speaking
                                      print('ok');
                                    } else {
                                      //not speaking
                                      print('no');
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
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              if (ans1.split("||")[0] == anstrue) {
                                (click == true)
                                    ? AudioPlayer()
                                        .play(AssetSource('music/correct.mp3'))
                                    : null;
                                showPopup(true);
                              } else {
                                (click == true)
                                    ? AudioPlayer().play(
                                        AssetSource('music/incorrect.mp3'))
                                    : null;
                                showPopup(false);
                              }
                            },
                            child: Container(
                                height: 45,
                                width: 385,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 223, 127),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${ans1.split("||")[0]} (${ans1.split("||")[1]}) แปลว่า ${ans1.split("||")[2]}',
                                          style: TextStyle(fontSize: 16),
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
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              if (ans2.split("||")[0] == anstrue) {
                                (click == true)
                                    ? AudioPlayer()
                                        .play(AssetSource('music/correct.mp3'))
                                    : null;
                                showPopup(true);
                              } else {
                                (click == true)
                                    ? AudioPlayer().play(
                                        AssetSource('music/incorrect.mp3'))
                                    : null;
                                showPopup(false);
                              }
                              //กดคำตอบ5
                            },
                            child: Container(
                                height: 45,
                                width: 385,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 223, 127),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${ans2.split("||")[0]} (${ans2.split("||")[1]}) แปลว่า ${ans2.split("||")[2]}',
                                          style: TextStyle(fontSize: 16),
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
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              if (ans3.split("||")[0] == anstrue) {
                                (click == true)
                                    ? AudioPlayer()
                                        .play(AssetSource('music/correct.mp3'))
                                    : null;
                                showPopup(true);
                              } else {
                                (click == true)
                                    ? AudioPlayer().play(
                                        AssetSource('music/incorrect.mp3'))
                                    : null;
                                showPopup(false);
                              }
                            },
                            child: Container(
                                height: 45,
                                width: 385,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 223, 127),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${ans3.split("||")[0]} (${ans3.split("||")[1]}) แปลว่า ${ans3.split("||")[2]}',
                                          style: TextStyle(fontSize: 16),
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
                              (click == true)
                                  ? AudioPlayer()
                                      .play(AssetSource('music/ck.mp3'))
                                  : null;
                              if (ans4.split("||")[0] == anstrue) {
                                /////////////////////////////////////////////////////////////
                                (click == true)
                                    ? AudioPlayer()
                                        .play(AssetSource('music/correct.mp3'))
                                    : null;
                                showPopup(true);
                              } else {
                                (click == true)
                                    ? AudioPlayer().play(
                                        AssetSource('music/incorrect.mp3'))
                                    : null;
                                showPopup(false);
                              }
                              //กดคำตอบ
                            },
                            child: Container(
                                height: 45,
                                width: 385,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 252, 223, 127),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${ans4.split("||")[0]} (${ans4.split("||")[1]}) แปลว่า ${ans4.split("||")[2]}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                                _lastWords = "";
                              });
                              speechtotext();
                            },
                            icon: Icon(Icons.mic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ));
  }

  void showPopup(istrue) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 192, 91),
          content: SingleChildScrollView(
            child: Column(
              children: [
                (istrue == true)
                    ? Image.asset(
                        'assets/images/victory.png',
                        height: 130,
                      )
                    : Image.asset(
                        'assets/images/incorrect.png',
                        height: 130,
                      ),
                SizedBox(
                  height: 15,
                ),
                (istrue == false)
                    ? Text(
                        'คำตอบที่ถูกคือ\n"${anstrue}"',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )
                    : Container(),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 133,
                  child: ElevatedButton(
                    onPressed: () {
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      if (widget.chap_cur == widget.row) {
                        if (istrue == true) {
                          updatescore(widget.chap, widget.chap_cur + 1, 1)
                              .then((value) {
                            Navigator.pop(context);
                            finish(value);
                          });
                        } else {
                          updatescore(widget.chap, widget.chap_cur + 1, 0)
                              .then((value) {
                            Navigator.pop(context);
                            finish(value);
                          });
                        }
                      } else {
                        if (istrue == true) {
                          updatescore(widget.chap, widget.chap_cur + 1, 1)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => questionPage(
                                          row: widget.row,
                                          chap: widget.chap,
                                          chap_cur: widget.chap_cur + 1,
                                          user: widget.user,
                                        )));
                          });
                        } else {
                          updatescore(widget.chap, widget.chap_cur + 1, 0)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => questionPage(
                                          row: widget.row,
                                          chap: widget.chap,
                                          chap_cur: widget.chap_cur + 1,
                                          user: widget.user,
                                        )));
                          });
                        }
                      }
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'ต่อไป',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )),
    );
  }

  void speechtotext() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, myState) {
        void _startListening() async {
          await _speechToText.listen(
              onResult: (SpeechRecognitionResult result) {
            myState(() {
              _lastWords = result.recognizedWords.toLowerCase();

              print(_lastWords);
            });
          });
        }

        void _stopListening() async {
          await _speechToText.stop();
          myState(() {});
        }

        return AlertDialog(
            backgroundColor: Color.fromARGB(255, 255, 192, 91),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '$_lastWords',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          IconButton(
                            iconSize: 40,
                            onPressed: () {
                              _speechToText.isNotListening
                                  ? _startListening()
                                  : _stopListening();
                              myState(() {});
                            },
                            icon: Icon(_speechToText.isNotListening
                                ? Icons.mic_off
                                : Icons.mic),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_lastWords == anstrue) {
                                Navigator.pop(context);
                                (click == true)
                                    ? AudioPlayer()
                                        .play(AssetSource('music/correct.mp3'))
                                    : null;
                                showPopup(true);
                              } else {
                                Navigator.pop(context);
                                (click == true)
                                    ? AudioPlayer().play(
                                        AssetSource('music/incorrect.mp3'))
                                    : null;
                                showPopup(false);
                              }
                            }, //ฟังชั่นการกดปุ่ม
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 232, 207),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'ตกลง',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, //ฟังชั่นการกดปุ่ม
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 232, 207),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'ยกเลิก',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      }),
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
                          (click == true)
                              ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                              : null;
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
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      Navigator.pop(context);
                    }, //ฟังชั่นการกดปุ่ม กลับหน้าเดิม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'ดำเนินการต่อ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // SizedBox(
                //   height: 40,
                //   width: 180,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       //กดคำตอบ
                //     }, //ฟังชั่นการกดปุ่ม
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Color.fromARGB(255, 248, 232, 207),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //     ),
                //     child: const Text(
                //       'Option',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      (click == true)
                          ? AudioPlayer().play(AssetSource('music/ck.mp3'))
                          : null;
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }, //ฟังชั่นการกดปุ่ม
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 248, 232, 207),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'กลับไปที่เมนู',
                      //................................................................................ยังไม่ได้ลิ้งไปหน้าแรก
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

  void finish(sc) {
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
                    'จำนวนข้อที่ถูกคือ $sc/${widget.row}',
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
                            (click == true)
                                ? AudioPlayer()
                                    .play(AssetSource('music/ck.mp3'))
                                : null;
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }, //ฟังชั่นการกดปุ่ม
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 248, 232, 207),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'ตกลง',
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
