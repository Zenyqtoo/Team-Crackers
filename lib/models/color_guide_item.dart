import 'package:flutter/material.dart';

/// Model class for color guide items
/// Provides information about each alert type's visual appearance
class ColorGuideItem {
  final Color color;          // LED color for this alert
  final IconData icon;        // Material icon
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
  /// This serves as the reference manual for users
  static List<ColorGuideItem> getAllGuides() {
    return [
      ColorGuideItem(
        color: Colors.red,
        icon: Icons.local_fire_department,  // Fire icon
        title: 'Fire Emergency',
        pattern: 'Rapid flashing',
        severity: 'EMERGENCY',
        description: 'Evacuate immediately. Fire alarm has been triggered.',
      ),
      ColorGuideItem(
        color: Colors.blue,
        icon: Icons.door_front_door,        // Doorbell icon
        title: 'Doorbell',
        pattern: 'Slow flashing',
        severity: 'NORMAL',
        description: 'Someone is at the front door.',
      ),
      ColorGuideItem(
        color: Colors.cyan,
        icon: Icons.motion_photos_on,       // Motion detected icon
        title: 'Motion Detected',
        pattern: 'Pulsing',
        severity: 'INFO',
        description: 'Camera detected movement in monitored area.',
      ),
      ColorGuideItem(
        color: Colors.green,
        icon: Icons.kitchen,                // Microwave icon
        title: 'Microwave',
        pattern: 'Two short flashes',
        severity: 'NORMAL',
        description: 'Microwave cooking cycle has finished.',
      ),
      ColorGuideItem(
        color: const Color(0xFF0D47A1),    // Dark blue
        icon: Icons.water_damage,           // Water leak icon
        title: 'Water Leak',
        pattern: 'Fast pulse',
        severity: 'WARNING',
        description: 'Water leak detected. Check immediately.',
      ),
      ColorGuideItem(
        color: Colors.purple,
        icon: Icons.local_shipping,         // Package delivery icon
        title: 'Package Delivery',
        pattern: 'Three flashes',
        severity: 'INFO',
        description: 'Package has been delivered to your door.',
      ),
      ColorGuideItem(
        color: Colors.white,
        icon: Icons.security,               // Intruder alert icon
        title: 'Intruder Alert',
        pattern: 'Alternating red/white',
        severity: 'EMERGENCY',
        description: 'Unauthorized entry detected.',
      ),
      ColorGuideItem(
        color: Colors.orange,
        icon: Icons.smoke_free,             // Smoke detector icon
        title: 'Smoke Detector',
        pattern: 'Rapid pulse',
        severity: 'WARNING',
        description: 'Smoke detected in the house.',
      ),
    ];
  }
}
