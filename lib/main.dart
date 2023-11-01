import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/nav_test_screen.dart';
import 'package:mobile_project/Screens/test_widget_screen.dart';
import 'Screens/test_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          child: const Text(
            'Go To Nav Test Screen',
            style: TextStyle(fontSize: 26),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NavTestScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
