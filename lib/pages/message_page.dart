import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _textController = TextEditingController();
  List<String> _messages = [];
  FocusNode? _focusNode = FocusNode();
  final apiKey = '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';

  void _submitMessage() {
    setState(() {
      _messages.add(_textController.text);
      _textController.clear();
    });
    FocusScope.of(context).requestFocus(_focusNode);
    // getCompletion('text-ada-001', _messages[_messages.length - 1]);
    getCompletion('text-davinci-003', _messages[_messages.length - 1]);
  }

  Future<void> getCompletion(String model, String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': '$model',
        'prompt': '$prompt',
        'max_tokens': 100,
        'suffix': 'Over N Out'
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      print(responseJson);
      setState(() {
        _messages.add(responseJson['choices'][0]['text']);
      });
    } else {
      print('Request failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: _messages
                        .map((message) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(message),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            FocusScope(
              // node: _focusNode,
              child: TextField(
                focusNode: _focusNode,
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your message',
                ),
                onSubmitted: (value) => _submitMessage(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitMessage,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
