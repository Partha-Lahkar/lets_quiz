import 'package:adv_basics/data/questions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenanswers,
    required this.onRestart,
  });
  final void Function() onRestart;
  final List<String> choosenanswers;

  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenanswers.length; i++) {
      //loop
      summary.add(
        {
          'Question_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenanswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final SummaryData = getsummarydata();
    final numTotalQuestion = questions.length;
    final numCOrrectQuestion = SummaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity, // use as much as horizontal space
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCOrrectQuestion out of $numTotalQuestion questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getsummarydata()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
