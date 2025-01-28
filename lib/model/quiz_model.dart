class QuizModel {
  String question;
  List<String> answers;
  int correctAnswerIndex;

  QuizModel(this.question, this.answers, this.correctAnswerIndex);

  List<String> getshuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
