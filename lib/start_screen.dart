import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//column add widgets below each and other
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assests/images/quizlogo.png',
            width: 800,
            height: 390,
            color:
                const Color.fromARGB(255, 234, 120, 13), //overlay the quiz logo
          ),

          // Opacity(
          //   opacity: 1,
          //   child: Image.asset(
          //     'assests/images/quizlogo.png',
          //     width: 800,
          //     height: 390,
          //   ),
          // ),
          const SizedBox(height: 0),
          Text(
            "------Happy Devloping-----",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 124, 50, 74),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 15, 13, 9),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}
