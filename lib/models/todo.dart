import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String title;
  bool isDone;

  Todo(this.title, {this.isDone = false});
}