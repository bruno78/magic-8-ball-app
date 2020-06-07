import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() => runApp(
  MaterialApp(
    home: MyMagic8BallApp()
  )
);

class MyMagic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Ball()
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _Ball createState() => _Ball();
}

class _Ball extends State<Ball> {
  ShakeDetector _detector;
  int _randomNum = 1;

  void _generateRandomNumber() {
    _randomNum = Random().nextInt(5) + 1;
  }

  @override
  void initState() {
    _detector = ShakeDetector.waitForStart(
      onPhoneShake: () {
        setState(() {
          _generateRandomNumber();
        });
      }
    );
    _detector.startListening();
    super.initState();
  }

  @override
  void dispose() {
    _detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset('images/ball$_randomNum.png'),
      ),
    );
  }

}