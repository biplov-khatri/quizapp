// settings.dart

import 'package:flutter/material.dart';
import 'theme_provider.dart';

class AppSettings {
  static ThemeProvider themeProvider = ThemeProvider();
  // other settings...

  static ThemeData getTheme() {
    return ThemeData(
      // Define your theme properties for light mode here
      // For example:
      primaryColor: Colors.blue,
      // ... other properties
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
      // Define your theme properties for dark mode here
      // For example:
      primaryColor: Colors.teal,
      // ... other properties
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dark Mode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Enable Dark Mode'),
              value: AppSettings.themeProvider.currentTheme == ThemeMode.dark,
              onChanged: (value) {
                // Update the dark mode setting
                AppSettings.themeProvider.toggleDarkMode(value);
                // Trigger a rebuild of the widget tree
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Toggle dark mode when the button is pressed
                AppSettings.themeProvider.toggleDarkMode(
                    AppSettings.themeProvider.currentTheme != ThemeMode.dark);
                // Trigger a rebuild of the widget tree
                setState(() {});
              },
              child: Text(
                'Toggle Dark Mode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = AppSettings.themeProvider.currentTheme == ThemeMode.dark
        ? AppSettings.getDarkTheme()
        : AppSettings.getTheme();

    return MaterialApp(
      title: 'My App',
      theme: currentTheme,
      home: SettingsScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}
