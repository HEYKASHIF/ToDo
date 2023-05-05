import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addToDoPage extends StatefulWidget {
  const addToDoPage({super.key});

  @override
  State<addToDoPage> createState() => _addToDoPageState();
}

class _addToDoPageState extends State<addToDoPage> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
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
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: TitleController,
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: DescriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: submitData,
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> submitData() async {
    //get data from the form
    final title = TitleController.text;
    final description = DescriptionController.text;
    //submit the data to the server
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    final url = 'https://api.nstack.in/v1/todos';

    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {"content-type": "application/json"},
    );

    void ShowSuccessMsg(String message) {
      final snackBar = SnackBar(content: Text(message));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void ShowErrorMsg(String message) {
      final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (response.statusCode == 201) {
      ShowSuccessMsg('Creation Success');
      TitleController.text = '';
      DescriptionController.text = '';
    } else {
      ShowErrorMsg('Creation Failed');
    }

    //show success or fail message based on the status
  }
}
