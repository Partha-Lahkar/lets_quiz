import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemdata, {super.key});
  final Map<String, Object> itemdata;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemdata['user_answer'] == itemdata['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemdata['Question_index'] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemdata['questions'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height:5),
                Text(itemdata['user_answer']as String,
                style:const TextStyle(
                  color:Color.fromARGB(255, 29, 30, 31),
                )),
                Text(itemdata['correct_answer']as String,
                style:const TextStyle(
                  color:Color.fromARGB(255, 234, 20, 148),
                ))
          ],
        ))
      ],
    );
  }
}
