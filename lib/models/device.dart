import 'package:flutter/material.dart';

/// Represents different types of smart home devices
enum DeviceType {
  smartLED,      // LED strips and panels
  smartBulb,     // Individual smart bulbs
  camera,        // Security cameras
  doorbell,      // Smart doorbells
  controller,    // ESP32 or other controllers
  sensor         // Motion, water, smoke sensors
}

/// Model class representing a smart home device
/// Used for device management and connection status
class Device {
  final String id;           // Unique device identifier
  final String name;         // Display name
  final DeviceType type;     // Type of device
  final String room;         // Room location
  final bool isOnline;       // Connection status
  final IconData icon;       // Icon representation
  final Color color;         // Color for UI display
  final String? ipAddress;   // Network address (optional)
  final int? brightness;     // Current brightness (0-100, for lights only)

  /// Constructor with required and optional fields
  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.room,
    required this.isOnline,
    required this.icon,
    required this.color,
    this.ipAddress,
    this.brightness,
  });

  /// Returns the device type as a readable string
  String getTypeString() {
    switch (type) {
      case DeviceType.smartLED:
        return 'Smart LED';
      case DeviceType.smartBulb:
        return 'Smart Bulb';
      case DeviceType.camera:
        return 'Security Camera';
      case DeviceType.doorbell:
        return 'Doorbell';
      case DeviceType.controller:
        return 'Controller';
      case DeviceType.sensor:
        return 'Sensor';
    }
  }

  /// Returns the connection status as a readable string
  String get statusString => isOnline ? 'Online' : 'Offline';

  /// Returns the appropriate status color
  Color get statusColor => isOnline ? Colors.green : Colors.red;

  /// Checks if this device can display visual alerts (has lights)
  bool get canDisplayAlerts {
    return type == DeviceType.smartLED || type == DeviceType.smartBulb;
  }

  /// Creates a copy of this device with updated fields
  /// Useful for updating device state without mutation
  Device copyWith({
    String? id,
    String? name,
    DeviceType? type,
    String? room,
    bool? isOnline,
    IconData? icon,
    Color? color,
    String? ipAddress,
    int? brightness,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      room: room ?? this.room,
      isOnline: isOnline ?? this.isOnline,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      ipAddress: ipAddress ?? this.ipAddress,
      brightness: brightness ?? this.brightness,
    );
  }

  /// Factory method to create sample devices for demonstration
  static List<Device> getSampleDevices() {
    return [
      Device(
        id: 'led_living_room',
        name: 'Living Room LED Strip',
        type: DeviceType.smartLED,
        room: 'Living Room',
        isOnline: true,
        icon: Icons.lightbulb,
        color: Colors.amber,
        ipAddress: '192.168.1.10',
        brightness: 80,
      ),
      Device(
        id: 'bulb_bedroom',
        name: 'Bedroom Smart Bulb',
        type: DeviceType.smartBulb,
        room: 'Bedroom',
        isOnline: true,
        icon: Icons.wb_incandescent,
        color: Colors.orange,
        ipAddress: '192.168.1.11',
        brightness: 60,
      ),
      Device(
        id: 'camera_front',
        name: 'Front Door Camera',
        type: DeviceType.camera,
        room: 'Front Door',
        isOnline: true,
        icon: Icons.videocam,
        color: Colors.blue,
        ipAddress: '192.168.1.20',
      ),
      Device(
        id: 'doorbell_front',
        name: 'Smart Doorbell',
        type: DeviceType.doorbell,
        room: 'Front Door',
        isOnline: true,
        icon: Icons.doorbell,
        color: Colors.indigo,
        ipAddress: '192.168.1.21',
      ),
      Device(
        id: 'led_kitchen',
        name: 'Kitchen LED Panel',
        type: DeviceType.smartLED,
        room: 'Kitchen',
        isOnline: true,
        icon: Icons.light,
        color: Colors.teal,
        ipAddress: '192.168.1.12',
        brightness: 100,
      ),
      Device(
        id: 'camera_backyard',
        name: 'Backyard Camera',
        type: DeviceType.camera,
        room: 'Backyard',
        isOnline: true,
        icon: Icons.videocam,
        color: Colors.blue,
        ipAddress: '192.168.1.22',
      ),
      Device(
        id: 'led_hallway',
        name: 'Hallway LED Strip',
        type: DeviceType.smartLED,
        room: 'Hallway',
        isOnline: false, // Offline for demonstration
        icon: Icons.lightbulb_outline,
        color: Colors.grey,
        ipAddress: '192.168.1.13',
      ),
      Device(
        id: 'controller_main',
        name: 'ESP32 Controller',
        type: DeviceType.controller,
        room: 'Main Hub',
        isOnline: true,
        icon: Icons.memory,
        color: Colors.purple,
        ipAddress: '192.168.1.100',
      ),
    ];
  }
}