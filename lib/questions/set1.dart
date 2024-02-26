import '../quiz_question.dart';

final List<QuizQuestion> set1Questions = [
  QuizQuestion(
    question: "What is the legal blood alcohol concentration (BAC) limit for drivers in Japan?",
    options: ["0.03%", "0.05%", "0.08%", "0.10%"],
    correctAnswer: "0.03%",
    remark: "The legal BAC limit for drivers in Japan is 0.03%.",
  ),
  QuizQuestion(
    question: "How many demerit points will be added to your record for speeding in a school zone?",
    options: ["2 points", "4 points", "6 points", "8 points"],
    correctAnswer: "6 points",
    remark: "Speeding in a school zone adds 6 demerit points to your record.",
  ),
  // Add remarks to other questions similarly
  // ...

  QuizQuestion(
    question: "What should you do when you encounter an ambulance with its siren on?",
    options: [
      "Speed up to clear the way quickly",
      "Continue at the same speed",
      "Pull over to the side of the road and stop",
      "Ignore it and continue driving"
    ],
    correctAnswer: "Pull over to the side of the road and stop",
    remark: "When you encounter an ambulance with its siren on, pull over to the side of the road and stop.",
  ),
];
