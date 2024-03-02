import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../quiz_question.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizQuestion> questions;

  const QuizScreen({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  var currentQuestionIndex = 0;
  int quizDuration = 1800; // 30 minutes in seconds
  int seconds = 1800;
  Timer? timer;

  int points = 0;

  var isLoaded = false;

  late List<QuizQuestion> quizQuestions;

  var optionsColor = List<Color>.generate(4, (index) => Colors.white);
  var userSelectedIndex;
  late String correctAnswer;

  // Add this variable at the beginning of the _QuizScreenState class
  bool showNextQuestionButton = false;

  @override
  void initState() {
    super.initState();
    shuffleQuestions();
    startTimer();
  }

  void shuffleQuestions() {
    quizQuestions = List.from(widget.questions)..shuffle();
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
    resetColors();
    userSelectedIndex = null; // Reset user selection
    showNextQuestionButton = false; // Reset the button visibility

    if (currentQuestionIndex < quizQuestions.length - 1) {
      currentQuestionIndex++;
      updateCurrentQuestion();
    } else {
      timer!.cancel();
      // Handle quiz completion
      showResult();
    }
  }

  void updateCurrentQuestion() {
    correctAnswer = quizQuestions[currentQuestionIndex].correctAnswer;
    setState(() {
      shuffleOptions();
    });
  }

  void shuffleOptions() {
    quizQuestions[currentQuestionIndex].options.shuffle();
  }

  showResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          totalPoints: points,
          totalQuestions: quizQuestions.length,
        ),
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
              : Container(), // Empty container when no questions remaining
        ),
      ),
    );
  }

  Widget buildQuizScreen(Size size) {
    var currentQuestion = quizQuestions[currentQuestionIndex];
    correctAnswer = currentQuestion.correctAnswer;

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
                    "${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}",
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: seconds / 1800,
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
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          // Check if the image path is provided
          if (currentQuestion.imagePath != null)
            Image.asset(
              currentQuestion.imagePath!,
              width: size.width - 100,
              height: size.height * 0.2,
              fit: BoxFit.cover,
            ),
          Text(
            currentQuestion.question,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: currentQuestion.options.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    userSelectedIndex = index;
                    if (correctAnswer == currentQuestion.options[index]) {
                      optionsColor[index] = Colors.green;
                      points = points + 1; // Each correct answer is worth 1 point
                    } else {
                      optionsColor[index] = Colors.red; // Red for incorrect answer
                      showNextQuestionButton = true; // Show the "Next Question" button
                    }

                    if (currentQuestionIndex < quizQuestions.length - 1 && !showNextQuestionButton) {
                      // Allow the user to proceed to the next question after a delay
                      Future.delayed(const Duration(seconds: 1), () {
                        gotoNextQuestion();
                      });
                    } else {
                      // Handle quiz completion or show warning
                      if (!showNextQuestionButton) {
                        showResult();
                      }
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
                        ? (correctAnswer == currentQuestion.options[index]
                        ? Colors.green // Correct answer selected
                        : Colors.redAccent) // Red for incorrect answer
                        : optionsColor[index],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    currentQuestion.options[index],
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              );
            },
          ),
          if (userSelectedIndex != null &&
              correctAnswer != currentQuestion.options[userSelectedIndex!])
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // Use a different color for the warning section
                color: Colors.grey[300]!.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Incorrect Answer",
                    style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your Answer: ${currentQuestion.options[userSelectedIndex!]}",
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Correct Answer: $correctAnswer",
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Remark: ${currentQuestion.remark}",
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ],
              ),
            ),
          // Add this button in the UI for the user to click and proceed to the next question
          if (showNextQuestionButton)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showNextQuestionButton = false; // Hide the button after clicking
                  gotoNextQuestion();
                });
              },
              child: Text(
                'Next Question',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
