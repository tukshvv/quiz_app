import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 200,
            color: const Color.fromARGB(150, 227, 223, 223),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Learn Flutter The Fun Way!',
              style: TextStyle(
                  color: Color.fromARGB(213, 241, 239, 239),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 35),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); //when clicked the screen is switched
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white38,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
