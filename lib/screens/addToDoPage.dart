import 'package:flutter/material.dart';

class addToDoPage extends StatefulWidget {
  const addToDoPage({super.key});

  @override
  State<addToDoPage> createState() => _addToDoPageState();
}

class _addToDoPageState extends State<addToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add To Do',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField()
        ],
      ),
    );
  }
}
