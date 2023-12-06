import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(),
              ),
              TextButton(
                onPressed: () {},
                child: Text('추가'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
