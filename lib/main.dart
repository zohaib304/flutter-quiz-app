import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favrorite color',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Blue', 'score': 10},
        {'text': 'Pink', 'score': 7},
        {'text': 'Yellow', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Rabit', 'score': 8},
        {'text': 'Snake', 'score': 6},
        {'text': 'Elephent', 'score': 2},
        {'text': 'Loin', 'score': 10},
      ]
    },
    {
      'questionText': 'Who is Favorite Hero?',
      'answers': [
        {'text': 'Robert Downey', 'score': 3},
        {'text': 'Johnny Depp', 'score': 9},
        {'text': 'Chris Hemsworth', 'score': 7},
        {'text': 'Will Smith', 'score': 4},
      ]
    }
  ];
  var _questionsIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
    print(_questionsIndex);
    if (_questionsIndex < _questions.length) {
      print("There are more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
        ),
        body: Center(
          child: _questionsIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionsIndex: _questionsIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
