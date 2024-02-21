// test.dart
import 'package:flutter/material.dart';
import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/text_style.dart';
import 'package:demo_application/quiz_screen.dart';
import 'package:demo_application/questions/set1.dart';
import 'package:demo_application/questions/set2.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Replace the image with a test icon
              const Icon(
                Icons.assignment,
                size: 100, // Adjust the size as needed
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              // Test 1 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set1Questions)),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: size.width - 40,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: headingText(color: blue, size: 18, text: "Test 1"),
                ),
              ),
              // Test 2 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set2Questions)),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: size.width - 40,
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
      ),
    );
  }
}
