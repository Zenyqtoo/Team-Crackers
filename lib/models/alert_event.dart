import 'package:flutter/material.dart';

/// Represents different severity levels for alerts
/// Used to determine visual priority and user response urgency
enum AlertSeverity {
  emergency,  // Immediate action required (fire, intruder)
  warning,    // Attention needed soon (water leak, smoke)
  info,       // Informational (motion detected, package)
  normal      // Regular notifications (doorbell, appliance)
}

/// Represents different flashing patterns for LED alerts
/// Each pattern provides unique visual identification
enum FlashPattern {
  rapid,       // Fast flashing for emergencies
  slow,        // Slow flashing for normal events
  pulse,       // Pulsing effect (fade in/out)
  double,      // Two quick flashes
  triple,      // Three quick flashes
  alternating  // Alternating colors (emergency)
}

/// Model class representing a single alert event
/// Contains all information needed to display and process an alert
class AlertEvent {
  final String id;              // Unique identifier
  final String title;           // Alert name (e.g., "Fire Emergency")
  final String description;     // Detailed message
  final Color color;            // LED/visual color
  final String icon;            // Emoji icon for quick recognition
  final AlertSeverity severity; // Urgency level
  final FlashPattern pattern;   // LED flash pattern
  final DateTime timestamp;     // When alert was triggered
  bool isActive;                // Whether alert is currently active

  /// Constructor with required fields
  AlertEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.severity,
    required this.pattern,
    required this.timestamp,
    this.isActive = true,
  });

  /// Creates a fire emergency alert
  /// This is the highest priority alert with rapid red flashing
  factory AlertEvent.fireEmergency() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'FIRE EMERGENCY',
      description: 'Evacuate immediately! Fire alarm triggered.',
      color: Colors.red,
      icon: '🔥',
      severity: AlertSeverity.emergency,
      pattern: FlashPattern.rapid,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a water leak alert
  /// Warning level with dark blue color
  factory AlertEvent.waterLeak() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Water Leak',
      description: 'Water leak detected in bathroom',
      color: const Color(0xFF0D47A1),
      icon: '💧',
      severity: AlertSeverity.warning,
      pattern: FlashPattern.rapid,
      timestamp: DateTime.now(),
    );
  }

  /// Creates an intruder alert
  /// Emergency level with alternating white flashing
  factory AlertEvent.intruder() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Intruder Alert',
      description: 'Unauthorized entry detected',
      color: Colors.white,
      icon: '🚨',
      severity: AlertSeverity.emergency,
      pattern: FlashPattern.alternating,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a doorbell alert
  /// Normal level with slow blue flashing
  factory AlertEvent.doorbell() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Doorbell',
      description: 'Someone is at the front door',
      color: Colors.blue,
      icon: '🚪',
      severity: AlertSeverity.normal,
      pattern: FlashPattern.slow,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a motion detection alert
  /// Info level with pulsing cyan
  factory AlertEvent.motionDetected() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Motion Detected',
      description: 'Camera detected movement in backyard',
      color: Colors.cyan,
      icon: '👤',
      severity: AlertSeverity.info,
      pattern: FlashPattern.pulse,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a microwave finished alert
  /// Normal level with double green flash
  factory AlertEvent.microwaveFinished() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Microwave',
      description: 'Microwave cycle finished',
      color: Colors.green,
      icon: '🍽️',
      severity: AlertSeverity.normal,
      pattern: FlashPattern.double,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a package delivery alert
  /// Info level with triple purple flash
  factory AlertEvent.packageDelivery() {
    return AlertEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Package Delivery',
      description: 'Package delivered to front door',
      color: Colors.purple,
      icon: '📦',
      severity: AlertSeverity.info,
      pattern: FlashPattern.triple,
      timestamp: DateTime.now(),
    );
  }

  /// Returns a human-readable description of the flash pattern
  String getPatternDescription() {
    switch (pattern) {
      case FlashPattern.rapid:
        return 'Rapid flashing';
      case FlashPattern.slow:
        return 'Slow flashing';
      case FlashPattern.pulse:
        return 'Pulsing';
      case FlashPattern.double:
        return 'Two short flashes';
      case FlashPattern.triple:
        return 'Three flashes';
      case FlashPattern.alternating:
        return 'Alternating pattern';
    }
  }

  /// Returns a formatted time string (e.g., "Just now", "5m ago")
  String getTimeAgo() {
    final difference = DateTime.now().difference(timestamp);
    
    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}