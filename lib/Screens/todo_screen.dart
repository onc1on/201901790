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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore
                      .instance
                      .collection('todo')
                      .snapshots(), 
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                
                return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs[index];
                          return buildItem(data);
                        },
                      itemCount: snapshot.data!.docs.length,
                        
                    )
                );
                
              }
          ),
        ],
      ),
    );
  }

  Widget buildItem(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone:doc['isDone']);
    
    return ListTile(
      onTap: () => updateTodo(doc),
      title: Text(
        todo.title,
        style: todo.isDone?
        TextStyle(decoration: TextDecoration.lineThrough,)
        :null,
      ),
      
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {},
      ),
      
    );
  }
  void addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title':todo.title,'isDone':todo.isDone});
    textEditingController.text = '';
  }

  void updateTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance
        .collection('todo')
        .doc(doc.id).update({'isDone':!doc['isDone']});
  }
}


