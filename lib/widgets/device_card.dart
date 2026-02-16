import 'package:flutter/material.dart';
import '../models/device.dart';

/// Shows device type, status, and connection info
class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        
        // Device icon with colored background
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: device.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            device.icon,
            color: device.color,
            size: 28,
          ),
        ),
        
        // Device name and details
        title: Text(
          device.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            // Device type
            Text(
              device.getTypeString(),
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 2),
            // Room location
            Text(
              device.room,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
          ],
        ),
        
        // Status indicator
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Colored dot indicating online/offline
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: device.statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 4),
            // Status text
            Text(
              device.statusString,
              style: TextStyle(
                fontSize: 12,
                color: device.statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}