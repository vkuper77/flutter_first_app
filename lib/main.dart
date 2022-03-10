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
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 4},
        {'text': 'Dog', 'score': 6},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 7},
        {'text': 'Elephant', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s you favorite dish?',
      'answers': [
        {'text': 'Pizza', 'score': 4},
        {'text': 'Burger', 'score': 6},
        {'text': 'Sushi', 'score': 2},
        {'text': 'potate', 'score': 3}
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
              : Result(_totalScore)),
    );
  }
}
