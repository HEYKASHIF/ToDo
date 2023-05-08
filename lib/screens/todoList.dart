import 'package:flutter/material.dart';
import 'package:to_do/screens/addToDoPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  List item = [];
  @override
  void initState() {
    super.initState();
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        centerTitle: true,
        title: Text(
          'To Do',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add ToDo'),
      ),
    );
  }

  void navigateToAddPage() {
    final Route = MaterialPageRoute(
      builder: (context) => addToDoPage(),
    );
    Navigator.push(context, Route);
  }

  Future<void> FetchData() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        item = result;
      });
    } else {
      // show error
    }

    //show success or fail message based on the status
  }
}
