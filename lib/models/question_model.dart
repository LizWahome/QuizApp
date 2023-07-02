class Question {
  final String questionText;
  final List<Answer> answerList;
  final String feedback;

  Question({
    required this.questionText,
    required this.answerList,
    required this.feedback,
  });
}

class Answer {
  final String answerText;
  final String answerText2;

  Answer({required this.answerText, required this.answerText2});
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(Question(
      questionText:
          "What percentage of water consumption have you been able to reduce in the past year?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Have you implemented water-saving technologies or practices, such as low-flow fixtures or leak detection systems?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Are you monitoring and reporting your water usage on a regular basis?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Have you set any targets or goals for further reducing water consumption?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Do you have a system in place to detect and repair water leaks promptly?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Have you implemented water-efficient cleaning practices, such as using low-water consumption equipment or adopting efficient cleaning methods?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Have you optimized your water consumption in production processes or service provision?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  list.add(Question(
      questionText:
          "Are you actively monitoring and managing your wastewater or effluent to minimize water pollution?",
      answerList: [Answer(answerText: "Yes", answerText2: "No")],
      feedback: ""));
  return list;
}
