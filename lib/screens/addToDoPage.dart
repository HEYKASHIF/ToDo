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
            onPressed: () {},
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }

  void submitData() {
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
    http.post(uri);

    //show success or fail message based on the status
  }
}
