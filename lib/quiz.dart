import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];
  var activescreen = 'start-screen';

  void switchScreen() {
    setState(() {
      //when you call setstate in a class it will call the build method any again
      activescreen = 'question-screen';
    });
  }

  void chooseanswer(String answer) {
    selectedanswers.add(answer);

    if (selectedanswers.length == questions.length) {
      setState(() {
        activescreen = 'result_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedanswers = [];
      activescreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activescreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseanswer,
      );
    }
    if (activescreen == 'result_screen') {
      screenWidget = ResultsScreen(
        choosenanswers: selectedanswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 140, 115, 182),
                Color.fromARGB(255, 230, 226, 232)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
