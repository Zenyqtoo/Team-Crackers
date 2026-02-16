import 'package:flutter/material.dart';
import '../models/alert_event.dart';

/// Pulses and flashes to immediately grab the user's attention
class EmergencyBanner extends StatefulWidget {
  final AlertEvent alert;

  const EmergencyBanner({
    Key? key,
    required this.alert,
  }) : super(key: key);

  @override
  State<EmergencyBanner> createState() => _EmergencyBannerState();
}

class _EmergencyBannerState extends State<EmergencyBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create animation that pulses continuously
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true); // Repeats back and forth
  }

  @override
  void dispose() {
    // Clean up animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use AnimatedBuilder to rebuild only when animation changes
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // Color opacity varies with animation for pulsing effect
            color: widget.alert.color.withOpacity(0.8 + _controller.value * 0.2),
          ),
          child: Column(
            children: [
              // Large emoji icon
              Text(
                widget.alert.icon,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 8),

              // Alert title in uppercase for emphasis
              Text(
                widget.alert.title.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2, // Wider letter spacing for impact
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),

              // Alert description
              Text(
                widget.alert.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}