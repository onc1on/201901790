import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/input_test_screen.dart';
import 'package:mobile_project/Screens/test_widget_screen.dart';

import '../main.dart';

class NavTestScreen extends StatefulWidget {
  const NavTestScreen({super.key});

  @override
  State<NavTestScreen> createState() => _NavTestScreenState();
}

class _NavTestScreenState extends State<NavTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Test Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'Go To Home',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestWidgetScreen(),
                  ),
                );
              },
              child: Text(
                'Go To Test Widget',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputTestScreen(),
                  ),
                );
              },
              child: Text(
                'Go To Input Test',
                style: TextStyle(fontSize: 26),
              ),
            ),
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
      ),
    );
  }
}
