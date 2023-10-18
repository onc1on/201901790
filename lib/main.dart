import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: testWidget(),
      ),
    ),
  );
}

class testWidget extends StatefulWidget {
  const testWidget({super.key});

  @override
  State<testWidget> createState() => _testWidgetState();
}

class _testWidgetState extends State<testWidget> {
  final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick(timer);
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Hello, flutter",
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
          Text(
            "Hello, student",
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, 1",
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              Text(
                "Hello, 2",
                style: TextStyle(fontSize: 32, color: Colors.black),
              ),
              Column(
                children: [
                  Text(
                    "Hello, 3",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    "Hello, 4",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    "Hello, 5",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Text(
            DateTime.now().toString(),
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
          Stack(
            children: [
              Container(
                width: 250,
                height: 250,
                color: Colors.green,
              ),
              Container(
                transform: Matrix4.rotationZ(0.1),
                width: 220,
                height: 220,
                color: Colors.amberAccent,
              ),
              Container(
                transform: Matrix4.rotationZ(0.4),
                width: 200,
                height: 200,
                color: Colors.red,
                child: AnalogClock(
                  dialColor: null,
                  dateTime: DateTime.now(),
                  markingColor: Colors.teal,
                  hourNumberColor: Colors.teal,
                  secondHandColor: Colors.teal,
                ),
              ),
              Text(
                "Stack",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onTick(Timer timer) {
    print(DateTime.now().toString());
    setState(() {

    });
  }
}




