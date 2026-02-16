import 'package:flutter/material.dart';
import 'package:silent_guardian/screens/dashboard_screen.dart';
import 'package:silent_guardian/screens/color_guide_screen.dart';
import 'package:silent_guardian/screens/devices_screen.dart';
import 'package:silent_guardian/screens/settings_screen.dart';
import'package:silent_guardian/widgets/color_guide_card.dart';

/// Serves as the container for all major app sections
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Currently selected tab index
  int _selectedIndex = 0;

  // List of screens corresponding to each tab
  final List<Widget> _screens = [
    DashboardScreen(),    // Home/alerts view
    ColorGuideScreen(),   // Color reference
    DevicesScreen(),      // Device management
    SettingsScreen(),     // App settings
  ];

  /// Updates the selected tab when user taps navigation item
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the currently selected screen
      body: _screens[_selectedIndex],

      // Bottom navigation bar with 4 main sections
      bottomNavigationBar: Container(
        // Add shadow for visual separation
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.palette),
              label: 'Color Guide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.devices),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}