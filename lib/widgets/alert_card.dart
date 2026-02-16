import 'package:flutter/material.dart';
import '../models/alert_event.dart';
import 'flashing_color_indicator.dart';

/// Alert card widget that displays a single alert
/// Dismissible by swiping, includes flashing color indicator
class AlertCard extends StatelessWidget {
  final AlertEvent alert;
  final VoidCallback onDismiss;

  const AlertCard({
    Key? key,
    required this.alert,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Unique key for dismissible widget
      key: Key(alert.id),
      
      // Called when user swipes to dismiss
      onDismissed: (_) => onDismiss(),
      
      // Red background shown while swiping
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      
      // The actual alert card
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // Border matches the alert color
          border: Border.all(color: alert.color, width: 2),
          // Colored shadow for additional visual emphasis
          boxShadow: [
            BoxShadow(
              color: alert.color.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Flashing color indicator on the left
              FlashingColorIndicator(
                color: alert.color,
                pattern: alert.pattern,
              ),
              const SizedBox(width: 16),
              
              // Alert information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title row with icon and emergency badge
                    Row(
                      children: [
                        Text(
                          alert.icon,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            alert.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Show emergency badge for critical alerts
                        if (alert.severity == AlertSeverity.emergency)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'EMERGENCY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    // Alert description
                    Text(
                      alert.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Metadata row with time and pattern info
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          alert.getTimeAgo(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.lightbulb_outline,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          alert.getPatternDescription(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
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