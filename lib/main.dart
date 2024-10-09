import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Numbers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomNumbersScreen(),
    );
  }
}
class RandomNumbersScreen extends StatefulWidget {
  @override
  _RandomNumbersScreenState createState() => _RandomNumbersScreenState();
}
class _RandomNumbersScreenState extends State<RandomNumbersScreen> {
  List<int> redBalls = [];
  int blueBall = 0;
  @override
  void initState() {
    super.initState();
    generateNumbers();
  }
  void generateNumbers() {
    setState(() {
      redBalls = List.generate(6, (index) => Random().nextInt(33) + 1)
        ..sort()
        ..toSet()
            .toList();
      while (redBalls.length < 6) {
        int newNumber = Random().nextInt(33) + 1;
        if (!redBalls.contains(newNumber)) {
          redBalls.add(newNumber);
          redBalls.sort();
        }
      }
      blueBall = Random().nextInt(16) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('双色球摇号'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: redBalls.map((number) => CircleNumber(number)).toList(),
            ),
            SizedBox(height: 20),
            CircleNumber(blueBall, color: Colors.blue),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateNumbers,
              child: Text('Generate Numbers'),
            ),
          ],
        ),
      ),
    );
  }
}
class CircleNumber extends StatelessWidget {
  final int number;
  final Color color;
  CircleNumber(this.number, {this.color = Colors.red});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Text(
        '$number',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      )),
    );
  }
}

