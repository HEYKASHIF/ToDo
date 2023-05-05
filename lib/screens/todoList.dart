import 'package:flutter/material.dart';
import 'package:to_do/screens/addToDoPage.dart';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
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
}
