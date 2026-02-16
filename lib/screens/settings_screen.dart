import 'package:flutter/material.dart';
import '../widgets/setting_card.dart';

/// Settings screen for customizing alert behavior and app preferences
/// Allows users to personalize their experience based on their needs
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // LED brightness level (10-100%)
  double _brightness = 80;

  // Flash speed setting (0-100, divided into slow/medium/fast)
  double _flashSpeed = 50;

  // Whether to flash lights in all rooms for each alert
  bool _multiRoomAlerts = true;

  // Whether to vibrate phone when alert triggers
  bool _vibrationFeedback = true;

  // Whether emergency alerts override all other alerts
  bool _emergencyOverride = true;

  /// Returns human-readable speed based on slider value
  String get _speedLabel {
    if (_flashSpeed < 33) return 'Slow';
    if (_flashSpeed < 66) return 'Medium';
    return 'Fast';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section: Alert Customization
          const Text(
            'Customize Alert Behavior',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // LED Brightness Control
          SettingCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.brightness_6, color: Colors.amber),
                    const SizedBox(width: 12),
                    const Text(
                      'LED Brightness',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    // Display current brightness percentage
                    Text(
                      '${_brightness.round()}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Slider for brightness adjustment
                Slider(
                  value: _brightness,
                  min: 10,
                  max: 100,
                  divisions: 9, // Creates 10% increments
                  activeColor: Colors.amber,
                  onChanged: (value) {
                    setState(() {
                      _brightness = value;
                    });
                    // TODO: Send brightness update to connected devices
                  },
                ),
              ],
            ),
          ),

          // Flash Speed Control
          SettingCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.speed, color: Colors.indigo),
                    const SizedBox(width: 12),
                    const Text(
                      'Flash Speed',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    // Display current speed label
                    Text(
                      _speedLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Slider with 3 discrete options
                Slider(
                  value: _flashSpeed,
                  min: 0,
                  max: 100,
                  divisions: 2, // Creates 3 options: slow, medium, fast
                  activeColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      _flashSpeed = value;
                    });
                    // TODO: Update flash speed for all devices
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Section: System Features
          const Text(
            'System Features',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Multi-Room Alerts Toggle
          SettingCard(
            child: SwitchListTile(
              value: _multiRoomAlerts,
              onChanged: (value) {
                setState(() {
                  _multiRoomAlerts = value;
                });
                // TODO: Update multi-room setting
              },
              title: const Text('Multi-Room Alerts'),
              subtitle: const Text('Flash lights in all rooms simultaneously'),
              secondary: const Icon(Icons.home, color: Colors.blue),
              activeColor: Colors.indigo,
            ),
          ),

          // Vibration Feedback Toggle
          SettingCard(
            child: SwitchListTile(
              value: _vibrationFeedback,
              onChanged: (value) {
                setState(() {
                  _vibrationFeedback = value;
                });
                // TODO: Update vibration setting
              },
              title: const Text('Vibration Feedback'),
              subtitle: const Text('Vibrate phone on alert'),
              secondary: const Icon(Icons.vibration, color: Colors.purple),
              activeColor: Colors.indigo,
            ),
          ),

          // Emergency Override Toggle
          SettingCard(
            child: SwitchListTile(
              value: _emergencyOverride,
              onChanged: (value) {
                setState(() {
                  _emergencyOverride = value;
                });
                // TODO: Update emergency override setting
              },
              title: const Text('Emergency Override'),
              subtitle: const Text('Emergency alerts override all other alerts'),
              secondary: const Icon(Icons.warning, color: Colors.red),
              activeColor: Colors.indigo,
            ),
          ),

          const SizedBox(height: 24),

          // Section: Room Configuration
          const Text(
            'Room Configuration',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Room Configuration Option
          SettingCard(
            child: ListTile(
              leading: const Icon(Icons.meeting_room, color: Colors.teal),
              title: const Text('Configure Rooms'),
              subtitle: const Text('Set alert preferences per room'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to room configuration screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Room configuration coming soon'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),

          // Color Customization Option
          SettingCard(
            child: ListTile(
              leading: const Icon(Icons.palette, color: Colors.pink),
              title: const Text('Customize Colors'),
              subtitle: const Text('Change alert colors and patterns'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to color customization screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Color customization coming soon'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Section: About
          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // App Information
          SettingCard(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline, color: Colors.indigo),
                  title: const Text('App Version'),
                  subtitle: const Text('1.0.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: Colors.orange),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open help documentation
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined, color: Colors.green),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open privacy policy
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}