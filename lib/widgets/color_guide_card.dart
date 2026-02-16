import 'package:flutter/material.dart';

/// Model class for color guide items
/// Provides information about each alert type's visual appearance
class ColorGuideItem {
  final Color color;          // LED color for this alert
  final IconData icon;        // Icon for the alert
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
        icon: Icons.fireplace,
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
        icon: Icons.water_damage,
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
        icon: Icons.warning,
        title: 'Intruder Alert',
        pattern: 'Alternating red/white',
        severity: 'EMERGENCY',
        description: 'Unauthorized entry detected.',
      ),
      ColorGuideItem(
        color: Colors.orange,
        icon: Icons.smoke_free,
        title: 'Smoke Detector',
        pattern: 'Rapid pulse',
        severity: 'WARNING',
        description: 'Smoke detected in the house.',
      ),
    ];
  }
}

/// Card widget for displaying color guide information
class ColorGuideCard extends StatelessWidget {
  final ColorGuideItem guide;

  const ColorGuideCard({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: guide.color.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          guide.icon,
          color: guide.color,
          size: 32,
        ),
        title: Text(
          guide.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pattern: ${guide.pattern}'),
            Text('Severity: ${guide.severity}'),
            Text(guide.description),
          ],
        ),
      ),
    );
  }
}

/// Full screen that displays all color guide cards
class ColorGuideScreen extends StatelessWidget {
  const ColorGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final guides = ColorGuideItem.getAllGuides();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Color Guide',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Each alert is assigned a specific color and flashing pattern for instant recognition.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),

          // Display all guides
          ...guides.map((guide) => ColorGuideCard(guide: guide)),
        ],
      ),
    );
  }
}
