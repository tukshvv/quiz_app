// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class question_Screen extends StatefulWidget {
  const question_Screen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<question_Screen> createState() {
    return _question_ScreenState();
  }
}

class _question_ScreenState extends State<question_Screen> {
  var currentquestionindex = 0;

  void answerquestion(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical stretching
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //horizontal strecthing
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentquestion.getShuffledList().map((answers) {
              return AnswerButton(
                  answerText: answers,
                  onTap: () {
                    answerquestion(answers);
                  });
            })
          ],
        ),
      ),
    );
  }
}
