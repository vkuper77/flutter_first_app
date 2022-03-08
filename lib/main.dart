import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var finish = false;

  final _questions = const [
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

  void _answerQuestions() {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        finish = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = _questions[_questionIndex]['questionText'];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: !finish
              ? Quiz(
                  question: question as String,
                  questions: _questions,
                  index: _questionIndex,
                  callback: _answerQuestions)
              : Result()),
    );
  }
}
