// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_application/const/colors.dart';
import 'package:demo_application/navbar.dart'; // Import your custom bottom navigation bar
import 'package:demo_application/const/images.dart';
import 'package:demo_application/const/text_style.dart';
import 'package:demo_application/test.dart';
import 'package:demo_application/study_materials.dart'; // Import the StudyMaterialsPage

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
      home: const MainScreen(),
      theme: ThemeData(
        fontFamily: "quick",
      ),
      title: "Demo",
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
   const StudyMaterialsPage(),
    const TestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    "\n Developed by Khatori Tech Solution",
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TestPage()),
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
                        child: headingText(color: blue, size: 18, text: "Test"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const StudyMaterialsPage()),
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
                        child: headingText(color: blue, size: 18, text: "Study Materials"),
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
