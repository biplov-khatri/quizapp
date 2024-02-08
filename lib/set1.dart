import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

final List<QuizQuestion> set1Questions = [

  QuizQuestion(
    question: "What is 2 + 2?",
    options: ["3", "4", "5", "6"],
    correctAnswer: "4",
  ),
  QuizQuestion(
    question: "Which planet is known as the Red Planet?",
    options: ["Earth", "Mars", "Jupiter", "Venus"],
    correctAnswer: "Mars",
  ),
  QuizQuestion(
    question: "In Japan, what color is used for stop signs?",
    options: ["Red", "Yellow", "Blue", "Green"],
    correctAnswer: "Red",
  ),
  QuizQuestion(
    question: "What does a triangular road sign indicate in Japan?",
    options: ["Stop", "Yield", "No Entry", "Warning"],
    correctAnswer: "Warning",
  ),
  QuizQuestion(
    question: "What is the legal age to obtain a driving license in Japan?",
    options: ["18", "20", "16", "22"],
    correctAnswer: "18",
  ),
];
