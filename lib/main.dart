import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestions() {
    setState(() {
      if (_questionIndex < 2) {
        _questionIndex++;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s you favorite color?',
        'answers': ['Red', 'Blue', 'Green', 'White']
      },
      {
        'questionText': 'What\'s you favorite animal?',
        'answers': ['Cat', 'Dog', 'Rabbit', 'Snake', 'Lion', 'Elephant']
      },
      {
        'questionText': 'What\'s you favorite dish?',
        'answers': ['Pizza', 'Burger', 'Sushi', 'potate']
      },
    ];

    var question = questions[_questionIndex]['questionText'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(question),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestions, answer))
                .toList()
          ],
        ),
      ),
    );
  }
}
