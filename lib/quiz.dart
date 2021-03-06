import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> questions;
  final int index;
  final Function callback;

  Quiz(
      {required this.question,
      required this.questions,
      required this.index,
      required this.callback});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Question(question as String),
          ...(questions[index]['answers'] as List<Map<String, Object>>)
              .map((answer) => Answer(
                  () => callback(answer['score']), answer['text'] as String))
              .toList()
        ],
      );
}
