import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/images.dart';
import 'package:demo_application/const/text_style.dart';
import 'package:demo_application/quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_application/set1.dart';
import 'package:demo_application/set2.dart'; // Import set2.dart

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: blue));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Demo",
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

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
              colors: [blue, darkBlue],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: lightgrey, width: 2),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              Image.asset(
                elephant,
              ),
              const SizedBox(height: 20),
              normalText(color: lightgrey, size: 18, text: "Welcome to our"),
              headingText(color: Colors.white, size: 32, text: "Driving App"),
              const SizedBox(height: 20),
              normalText(
                  color: lightgrey,
                  size: 16,
                  text: "This app is designed for you to practice test for your driving Exam."
                      "\n Developed by KhatoriTech"),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizScreen(questions: set1Questions)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        width: size.width - 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: headingText(color: blue, size: 18, text: "Test 1"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizScreen(questions: set2Questions)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        width: size.width - 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: headingText(color: blue, size: 18, text: "Test 2"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
