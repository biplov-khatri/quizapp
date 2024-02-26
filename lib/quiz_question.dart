class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String remark; // Added remark property

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.remark, // Added remark property in the constructor
  });
}
