import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/test_widget.dart';

class TestWidgetScreen extends StatefulWidget {
  const TestWidgetScreen({super.key});

  @override
  State<TestWidgetScreen> createState() => _TestWidgetScreenState();
}

class _TestWidgetScreenState extends State<TestWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Widget Screen'),
      ),
      body: Column(
        children: [
          TestWidget(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Go To Back',
              style: TextStyle(fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}
