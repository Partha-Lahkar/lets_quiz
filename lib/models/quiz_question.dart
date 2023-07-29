class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getshuffledAnswers() {
    final shuffledList =
        List.of(answers); //only new listg will be shuffled not the original
    shuffledList.shuffle();
    return shuffledList;
  }
}
