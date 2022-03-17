import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/widgets/answer_boxes.dart';
import 'package:wordle/widgets/keypad.dart';
import 'package:wordle/word_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> answer = [];
  List<String> goal =
      kWordList[Random().nextInt(kWordList.length)].toUpperCase().split('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AnswerBoxes(answer: answer),
            const Spacer(),
            Keypad(
              pressedLetter: (inputAnswer) {
                setState(() {
                  answer = inputAnswer;
                });
              },
              pressedEnter: () {
                if (answer.length == 5) {
                  print(goal.toString() == answer.toString());
                }
              },
              pressedDelete: (inputAnswer) {
                setState(() {
                  answer = inputAnswer;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
