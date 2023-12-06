import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController textEditingController = new TextEditingController();


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
                child: TextField(
                  controller: textEditingController,
                ),
              ),
              TextButton(
                onPressed: () => addTodo(Todo(textEditingController.text)),
                child: Text('추가'),
              ),
            ],
          ),

        ],
      ),
    );
  }

  void addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title':todo.title,'isDone':todo.isDone});
    textEditingController.text = '';
  }
}


