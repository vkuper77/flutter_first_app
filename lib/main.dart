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
  var _totalScore = 0;
  var _finish = false;

  final _questions = const [
    {
      'questionText': 'What\'s you favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 30},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 70},
      ]
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 4},
        {'text': 'Dog', 'score': 7},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 8},
        {'text': 'Lion', 'score': 3},
        {'text': 'Elephant', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s you favorite dish?',
      'answers': [
        {'text': 'Pizza', 'score': 3},
        {'text': 'Burger', 'score': 7},
        {'text': 'Sushi', 'score': 9},
        {'text': 'potate', 'score': 5}
      ]
    },
  ];

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        _finish = true;
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
          body: !_finish
              ? Quiz(
                  question: question as String,
                  questions: _questions,
                  index: _questionIndex,
                  callback: _answerQuestions)
              : Result()),
    );
  }
}
