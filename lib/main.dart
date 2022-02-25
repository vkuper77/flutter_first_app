import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestions(length) {
    setState(() {
      if (_questionIndex < length - 1) {
        _questionIndex++;
      } else {
        _questionIndex = 0;
      }
    });
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
            Question(questions[_questionIndex]),
            RaisedButton(
              onPressed: () => _answerQuestions(questions.length),
              child: Text('Answer 1'),
            ),
            RaisedButton(
              onPressed: () => _answerQuestions(questions.length),
              child: Text('Answer 2'),
            ),
            RaisedButton(
              onPressed: () => _answerQuestions(questions.length),
              child: Text('Answer 3'),
            )
          ],
        ),
      ),
    );
  }
}
