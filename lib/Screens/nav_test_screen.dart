import 'package:flutter/material.dart';
import 'package:mobile_project/Screens/input_test_screen.dart';
import 'package:mobile_project/Screens/search_screen.dart';
import 'package:mobile_project/Screens/test_widget_screen.dart';
import 'package:mobile_project/Screens/weather_screen.dart';


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
        title: const Text('Nav Test Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
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
              child: const Text(
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
              child: const Text(
                'Go To Input Test',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(),
                  ),
                );
              },
              child: const Text(
                'Go To Weather',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Text(
                'Go To Search',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
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
