import 'package:flutter/material.dart';

/// Model class for color guide items
/// Provides information about each alert type's visual appearance
class ColorGuideItem {
  final Color color;          // LED color for this alert
  final IconData icon;        // Flutter IconData
  final String title;         // Alert name
  final String pattern;       // Flash pattern description
  final String severity;      // Severity level (EMERGENCY, WARNING, etc.)
  final String description;   // What this alert means

  /// Constructor with all required fields
  ColorGuideItem({
    required this.color,
    required this.icon,
    required this.title,
    required this.pattern,
    required this.severity,
    required this.description,
  });

  /// Returns the appropriate color for the severity badge
  Color getSeverityColor() {
    switch (severity.toUpperCase()) {
      case 'EMERGENCY':
        return Colors.red;
      case 'WARNING':
        return Colors.orange;
      case 'INFO':
        return Colors.blue;
      default:
        return Colors.green;
    }
  }

  /// Returns all pre-defined color guide items
  static List<ColorGuideItem> getAllGuides() {
    return [
      ColorGuideItem(
        color: Colors.red,
        icon: Icons.local_fire_department,
        title: 'Fire Emergency',
        pattern: 'Rapid flashing',
        severity: 'EMERGENCY',
        description: 'Evacuate immediately. Fire alarm has been triggered.',
      ),
      ColorGuideItem(
        color: Colors.blue,
        icon: Icons.door_front_door,
        title: 'Doorbell',
        pattern: 'Slow flashing',
        severity: 'NORMAL',
        description: 'Someone is at the front door.',
      ),
      ColorGuideItem(
        color: Colors.cyan,
        icon: Icons.motion_photos_on,
        title: 'Motion Detected',
        pattern: 'Pulsing',
        severity: 'INFO',
        description: 'Camera detected movement in monitored area.',
      ),
      ColorGuideItem(
        color: Colors.green,
        icon: Icons.kitchen,
        title: 'Microwave',
        pattern: 'Two short flashes',
        severity: 'NORMAL',
        description: 'Microwave cooking cycle has finished.',
      ),
      ColorGuideItem(
        color: const Color(0xFF0D47A1),
        icon: Icons.water_drop,
        title: 'Water Leak',
        pattern: 'Fast pulse',
        severity: 'WARNING',
        description: 'Water leak detected. Check immediately.',
      ),
      ColorGuideItem(
        color: Colors.purple,
        icon: Icons.local_shipping,
        title: 'Package Delivery',
        pattern: 'Three flashes',
        severity: 'INFO',
        description: 'Package has been delivered to your door.',
      ),
      ColorGuideItem(
        color: Colors.white,
        icon: Icons.security,
        title: 'Intruder Alert',
        pattern: 'Alternating red/white',
        severity: 'EMERGENCY',
        description: 'Unauthorized entry detected.',
      ),
      ColorGuideItem(
        color: Colors.orange,
        icon: Icons.warning,
        title: 'Smoke Detector',
        pattern: 'Rapid pulse',
        severity: 'WARNING',
        description: 'Smoke detected in the house.',
      ),
    ];
  }
}
