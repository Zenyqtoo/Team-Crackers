import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const SilentGuardianApp());
}

/// Configures theme, navigation, and app-wide settings
class SilentGuardianApp extends StatelessWidget {
  const SilentGuardianApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silent Guardian',
      debugShowCheckedModeBanner: false,
      
      // Light theme configuration with high contrast for accessibility
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
        
        // High contrast for better visibility
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      
      // Dark theme configuration
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      
      // Use light theme by default (can be made dynamic based on user preference)
      themeMode: ThemeMode.light,
      
      // Start with the main screen (bottom navigation)
      home: const MainScreen(),
    );
  }
}