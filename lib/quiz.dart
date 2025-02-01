// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key}); //accept and forward name key argument

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //'_' this will make this class private and can only be used in this file
  final List<String> selectedAnswers = [];
  var activescreen = 'start-screen';

  void SwitchScreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(
        answer); //we are not manipulating the string here, we are just adding up the new answers so the string can be final
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenwidget = StartScreen(SwitchScreen);

    if (activescreen == 'question-screen') {
      screenwidget = question_Screen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activescreen == 'results-screen') {
      screenwidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.deepPurpleAccent,
                  Color.fromARGB(255, 137, 96, 252),
                ],
              ),
            ),
            child: screenwidget),
      ),
    );
  }
}
