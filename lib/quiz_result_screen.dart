import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int totalPoints;
  final int totalQuestions;

  const QuizResultScreen({
    Key? key,
    required this.totalPoints,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = (totalPoints / totalQuestions) * 100;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.blueAccent],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Quiz Completed!",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                const SizedBox(height: 20),
                Text(
                  "Total Points: $totalPoints",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: percentage / 100,
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  "Accuracy: ${percentage.toStringAsFixed(2)}%",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text("Back to Main Screen"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
