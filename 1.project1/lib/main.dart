import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Image(image: AssetImage('images/dia.png')),
        ),
        appBar: AppBar(
          title: Center(child: Text('I am Rich ')),
          backgroundColor: Colors.orangeAccent,
        ),
      ),
    ),
  );
}
