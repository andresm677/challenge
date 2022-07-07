import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:naver2/Home/user_card.dart';
import 'package:naver2/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://jsonplaceholder.typicode.com/users";

  List<User> listModel = [];

  void fetchPosts() async {
    try {
      final responseData = await get(Uri.parse(url));
      final data = jsonDecode(responseData.body);
      setState(() {
        for (Map i in data) {
          listModel.add(User.fromJson(i));
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naver App'),
      ),
      body: ListView.builder(
        itemCount: listModel.length,
        itemBuilder: (context, i) {
          final post = listModel[i];

          return UserCard(user: post);
        },
      ),
    );
  }
}
