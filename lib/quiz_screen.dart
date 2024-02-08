import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'set1.dart'; // Import set1.dart file

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;

  int points = 0;

  var isLoaded = false;

  late List<QuizQuestion> quizQuestions;

  var optionsList = <String>[];

  var optionsColor = List<Color>.generate(4, (index) => Colors.white);

  var userSelectedIndex;

  @override
  void initState() {
    super.initState();
    // Initialize quiz questions from set1.dart
    quizQuestions = set1Questions;
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = List<Color>.generate(4, (index) => Colors.white);
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    userSelectedIndex = null; // Reset user selection
    timer!.cancel();
    seconds = 60;
    startTimer();

    if (currentQuestionIndex == quizQuestions.length) {
      // If all questions are answered, show the result
      showResult();
    }
  }

  showResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quiz Result"),
        content: Text("Total Points: $points"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the result dialog
              Navigator.pop(context); // Return to the main screen
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.blueAccent],
            ),
          ),
          child: currentQuestionIndex < quizQuestions.length
              ? buildQuizScreen(size)
              : buildResultScreen(size),
        ),
      ),
    );
  }

  Widget buildQuizScreen(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "$seconds",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: seconds / 60,
                      valueColor: const AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Question ${currentQuestionIndex + 1} of ${quizQuestions.length}",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            quizQuestions[currentQuestionIndex].question,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: quizQuestions[currentQuestionIndex].options.length,
            itemBuilder: (BuildContext context, int index) {
              var answer = quizQuestions[currentQuestionIndex].correctAnswer;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    userSelectedIndex = index;
                    if (answer == quizQuestions[currentQuestionIndex].options[index]) {
                      optionsColor[index] = Colors.green;
                      points = points + 1; // Each correct answer is worth 1 point
                    } else {
                      optionsColor[index] = Colors.red;
                    }

                    if (currentQuestionIndex < quizQuestions.length - 1) {
                      Future.delayed(const Duration(seconds: 1), () {
                        gotoNextQuestion();
                      });
                    } else {
                      timer!.cancel();
                      // Handle quiz completion
                      showResult();
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: size.width - 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: userSelectedIndex == index
                        ? (answer == quizQuestions[currentQuestionIndex].options[index]
                        ? Colors.green // Correct answer selected
                        : Colors.red) // Incorrect answer selected
                        : optionsColor[index],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    quizQuestions[currentQuestionIndex].options[index],
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              );
            },
          ),
          if (userSelectedIndex != null &&
              quizQuestions[currentQuestionIndex].correctAnswer !=
                  quizQuestions[currentQuestionIndex].options[userSelectedIndex!])
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Correct Answer: ${quizQuestions[currentQuestionIndex].correctAnswer}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildResultScreen(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Quiz Completed!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            "Total Points: $points",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
