import 'package:flutter/material.dart';
import 'package:app/api/api.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  response = await API.testAPI.test();
                  setState(() {});
                },
                child: Text('Test')),
            Text(response),
            TextButton(
                onPressed: () async {
                  response = '';
                  setState(() {});
                },
                child: Text('Clear Response')),
          ],
        ),
      ),
    );
  }
}
