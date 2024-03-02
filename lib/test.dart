import 'package:flutter/material.dart';
import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/text_style.dart';
import 'package:demo_application/layouts/quiz_screen.dart';
import 'package:demo_application/questions/set1.dart' as set1;
import 'package:demo_application/questions/set2.dart' as set2;
import 'package:demo_application/questions/set3.dart' as set3;
import 'package:demo_application/questions/set4.dart' as set4;
import 'package:demo_application/questions/set5.dart' as set5;
import 'package:demo_application/questions/set6.dart' as set6;

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter wise Test'),
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
          child: ListView(
            children: [
              const Icon(
                Icons.assignment,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              // Test 1 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set1.set1Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 1: Driver's Knowledge"),
                ),
              ),
              // Test 2 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set2.set2Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 2: Obey the signals"),
                ),
              ),
              // Test 3 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set3.set3Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 3: Obey signs, markings, etc."),
                ),
              ),
              // Test 4 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set4.set4Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 4: Where cars pass, where cars shouldn't"),
                ),
              ),
              // Test 5 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set5.set5Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 5: Priority for emergency vehicles, etc."),
                ),
              ),
              // Test 6 container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(questions: set6.set6Questions)),
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
                  child: headingText(color: blue, size: 18, text: "Unit 6: Traffic at intersections, railroad crossings"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
