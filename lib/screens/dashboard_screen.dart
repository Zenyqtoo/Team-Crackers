import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import '../models/alert_event.dart';
import '../widgets/emergency_banner.dart';
import '../widgets/status_card.dart';
import '../widgets/alert_card.dart';

/// Dashboard screen showing real-time alerts and system status
/// This is the main screen users see when opening the app
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // List of current alerts
  List<AlertEvent> alerts = [];
  
  // Timer for simulating random alerts (for demonstration)
  Timer? _simulationTimer;

  @override
  void initState() {
    super.initState();
    // Start alert simulation when screen loads
    _startSimulation();
  }

  @override
  void dispose() {
    // Clean up timer to prevent memory leaks
    _simulationTimer?.cancel();
    super.dispose();
  }

  /// Starts automatic alert simulation every 8 seconds
  /// In production, this would be replaced with real device connections
  void _startSimulation() {
    _simulationTimer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (mounted) {
        _addRandomAlert();
      }
    });
  }

  /// Adds a random alert from predefined types
  /// Simulates real-world alert triggers
  void _addRandomAlert() {
    final random = Random();
    
    // List of possible alert types
    final alertTypes = [
      AlertEvent.doorbell(),
      AlertEvent.motionDetected(),
      AlertEvent.microwaveFinished(),
      AlertEvent.packageDelivery(),
    ];

    // Randomly decide whether to trigger an alert (50% chance)
    if (random.nextBool()) {
      setState(() {
        // Add new alert at the beginning of the list
        alerts.insert(0, alertTypes[random.nextInt(alertTypes.length)]);
        
        // Keep only the 10 most recent alerts
        if (alerts.length > 10) {
          alerts.removeLast();
        }
      });
    }
  }

  /// Manually triggers a fire emergency alert
  /// Used for testing the emergency alert system
  void _triggerEmergency() {
    setState(() {
      alerts.insert(0, AlertEvent.fireEmergency());
    });
  }

  /// Manually triggers a water leak alert
  void _triggerWaterLeak() {
    setState(() {
      alerts.insert(0, AlertEvent.waterLeak());
    });
  }

  /// Manually triggers an intruder alert
  void _triggerIntruder() {
    setState(() {
      alerts.insert(0, AlertEvent.intruder());
    });
  }

  /// Dismisses an alert by removing it from the list
  void _dismissAlert(String id) {
    setState(() {
      alerts.removeWhere((alert) => alert.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter to show only active alerts
    final activeAlerts = alerts.where((a) => a.isActive).toList();
    
    // Check if there's an emergency alert
    final hasEmergency = activeAlerts.any((a) => a.severity == AlertSeverity.emergency);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Silent Guardian',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          // Notification icon (could show unread count)
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              // TODO: Show notification settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Emergency banner - shown when emergency alert is active
          // Takes full width and pulses to grab attention
          if (hasEmergency)
            EmergencyBanner(
              alert: activeAlerts.firstWhere(
                (a) => a.severity == AlertSeverity.emergency,
              ),
            ),
          
          // Status overview cards
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Shows number of active alerts
                Expanded(
                  child: StatusCard(
                    title: 'Active Alerts',
                    value: activeAlerts.length.toString(),
                    icon: Icons.warning_amber,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                // Shows number of online devices
                Expanded(
                  child: StatusCard(
                    title: 'Devices Online',
                    value: '8', // This would come from device manager
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Test alert buttons for demonstration
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Text(
                  'Test Alerts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Three buttons to test different alert types
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _triggerEmergency,
                        icon: const Text(''),
                        label: const Text('Fire'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _triggerWaterLeak,
                        icon: const Text(''),
                        label: const Text('Water'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D47A1),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _triggerIntruder,
                        icon: const Text(''),
                        label: const Text('Intruder'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Scrollable list of alerts
          Expanded(
            child: alerts.isEmpty
                // Empty state - shown when no alerts are active
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'All Clear',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'No active alerts',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                // Alert list - shows all active alerts
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: alerts.length,
                    itemBuilder: (context, index) {
                      return AlertCard(
                        alert: alerts[index],
                        onDismiss: () => _dismissAlert(alerts[index].id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}