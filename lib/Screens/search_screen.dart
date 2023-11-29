import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = new TextEditingController();
  late String inputText = '';
  late String recievedText = '';
  List<String> items = [''];
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
                  controller: textEditingController,
                  //onChanged: ( text) {
                  //  setState(() {
                  //    inputText = text;
                  //  });
                  //},
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchNaverLocal(textEditingController.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.lightBlue[200],
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Text('검색'),
                  ),
                ),
              ),
            ],
          ),
          Text('${items[0]}'),
        ],
      ),
    );
  }

  void searchNaverLocal(String text) async {

    Dio dio = new Dio();

    String clientId = dotenv.get("NAVER_CLIENT_ID");
    String clientSecret = dotenv.get("NAVER_CLIENT_SECRET");

    dio.options.headers['X-Naver-Client-Id']=clientId;
    dio.options.headers['X-Naver-Client-Secret']=clientSecret;



    String str = 'https://openapi.naver.com/v1/search/local.json?query=$text&display=10&start=1&sort=random';
    Response response;
    response = await dio.get(str);
    print(response.data.toString());
    var searchData = jsonDecode(response.toString());
    int total = searchData['total'];

    items.clear();
    for (int i =0; i<total; i++) {
    setState(() {
    //  recievedText = response.data.toString();

        items.add(searchData['items'][i].toString());
        print(items[i]);

    });
    }

  }
}
