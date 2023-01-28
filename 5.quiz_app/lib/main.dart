import 'dart:async';

import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:async/async.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> myIcons = [];

  String turnResult() {
    if (amountOfTrue > amountOfFalse) {
      return 'ÇOK İYİSİN';
    } else if (amountOfFalse > amountOfTrue) {
      return 'DAHA İYİSİNİ YAPABİLİRSİN';
    } else {
      return 'EŞİT';
    }
  }

  int time = 10;
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else {

        setState(() {
          time = 10;
          quizBrain.nextQuestion();
          amountOfFalse++;

        });
      }
    });
    super.initState();
  }

  void checkAnswer(bool answer) {
    if (quizBrain.isFinished()) {
      Alert(
        style: AlertStyle(
          animationType: AnimationType.grow,
          animationDuration: Duration(
            milliseconds: 1000,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        context: context,
        title: "Game Over",
        desc: turnResult(),
        buttons: [
          DialogButton(
            color: Colors.deepPurple.shade900,
            child: Text(
              "Play again!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                quizBrain.reset();
                amountOfFalse = 0;
                amountOfTrue = 0;
              });
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      bool correctAnswer = quizBrain.getAnswer();
      if (correctAnswer == answer) {
        amountOfTrue++;
      } else {
        amountOfFalse++;
      }
      setState(() {
        quizBrain.nextQuestion();
      });
    }
  }

  int amountOfTrue = 0;
  int amountOfFalse = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(Icons.check, color: Colors.green),
                Text(
                  '$amountOfTrue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              children: [
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 5.0,
                  percent: (10-time)/10,
                  center: new Text(
                    '$time',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  progressColor: Colors.lightBlueAccent,
                )
              ],
            ),
            Column(
              children: [
                Icon(Icons.close, color: Colors.red),
                Text(
                  '$amountOfFalse',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        )),
        Expanded(
          flex: 4,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                quizBrain.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text('True'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text('False'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
