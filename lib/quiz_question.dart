class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String remark;
  final String? imagePath; // Image asset path

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.remark,
    this.imagePath, // Added imagePath property in the constructor
  });
}
