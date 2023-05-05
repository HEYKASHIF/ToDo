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
        title: Text(
          'Add To Do',
        ),
      ),
    );
  }
}
