import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestions() {
    questionIndex = questionIndex + 1;
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s you favorite color?',
      'What\'s you favorite animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              onPressed: answerQuestions,
              child: Text('Answer 1'),
            ),
            RaisedButton(
              onPressed: answerQuestions,
              child: Text('Answer 2'),
            ),
            RaisedButton(
              onPressed: answerQuestions,
              child: Text('Answer 3'),
            )
          ],
        ),
      ),
    );
  }
}
