import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final assetsPlayer = AssetsAudioPlayer();
  void playSound({required int soundNumber}){
    assetsPlayer.open(Audio('assets/note$soundNumber.wav'));
  }

  Expanded buildKey({required int soundNumber , required Color color}){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
         playSound(soundNumber: soundNumber);
        },
        child: Text(''),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: [
              buildKey(soundNumber: 1, color: Colors.red),
              buildKey(soundNumber: 1, color: Colors.deepOrange),
              buildKey(soundNumber: 1, color: Colors.green),
              buildKey(soundNumber: 1, color: Colors.cyan),
              buildKey(soundNumber: 1, color: Colors.deepPurple),
              buildKey(soundNumber: 1, color: Colors.yellow),
              buildKey(soundNumber: 1, color: Colors.orange),

            ],
          ),
        ),
      ),
    );
  }
}
