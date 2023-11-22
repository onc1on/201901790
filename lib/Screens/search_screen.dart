import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String inputText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  onChanged: ( text) {
                    setState(() {
                      inputText = text;
                    });
                  },
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.lightBlue[200],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
