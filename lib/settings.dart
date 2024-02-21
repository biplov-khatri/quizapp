// settings.dart
import 'package:flutter/material.dart';

class AppSettings {
  static bool darkMode = false;

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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              value: AppSettings.darkMode,
              onChanged: (value) {
                // Update the dark mode setting
                AppSettings.darkMode = value;

                // Notify the framework that the state has changed
                if (value) {
                  // If dark mode is enabled, you can apply a dark theme here
                  // e.g., ThemeMode.dark or update specific theme properties
                  // based on your implementation.
                  // Apply your dark theme here:
                  // MyAppState.setTheme(AppSettings.getDarkTheme());
                } else {
                  // If dark mode is disabled, you can apply a light theme here
                  // e.g., ThemeMode.light or update specific theme properties
                  // based on your implementation.
                  // Apply your light theme here:
                  // MyAppState.setTheme(AppSettings.getTheme());
                }

                // You may also use Provider or any other state management solution
                // to handle the theme changes globally in your app.
              },
            ),
          ],
        ),
      ),
    );
  }
}
