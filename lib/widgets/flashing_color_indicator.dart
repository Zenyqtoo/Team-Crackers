import 'package:flutter/material.dart';
import '../models/alert_event.dart';

/// Animated color indicator that flashes according to the alert pattern
/// Provides visual feedback of how the LEDs would flash in real life
class FlashingColorIndicator extends StatefulWidget {
  final Color color;
  final FlashPattern pattern;

  const FlashingColorIndicator({
    Key? key,
    required this.color,
    required this.pattern,
  }) : super(key: key);

  @override
  State<FlashingColorIndicator> createState() =>
      _FlashingColorIndicatorState();
}

class _FlashingColorIndicatorState extends State<FlashingColorIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    // Set animation duration based on flash pattern
    final duration = _getDuration(widget.pattern);
    
    _controller = AnimationController(
      duration: duration,
      vsync: this,
    );
    
    // Different patterns use different animation behaviors
    if (widget.pattern == FlashPattern.pulse) {
      // Pulse reverses (fades in and out)
      _controller.repeat(reverse: true);
    } else {
      // Other patterns just repeat
      _controller.repeat();
    }
  }

  /// Returns animation duration based on flash pattern
  /// Faster patterns have shorter durations
  Duration _getDuration(FlashPattern pattern) {
    switch (pattern) {
      case FlashPattern.rapid:
        return const Duration(milliseconds: 300);
      case FlashPattern.slow:
        return const Duration(milliseconds: 1000);
      case FlashPattern.pulse:
        return const Duration(milliseconds: 800);
      case FlashPattern.double:
      case FlashPattern.triple:
      case FlashPattern.alternating:
        return const Duration(milliseconds: 600);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // Opacity changes with animation value (0.3 to 1.0)
            color: widget.color.withOpacity(0.3 + _controller.value * 0.7),
            // Shadow grows/shrinks with animation for glow effect
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.4),
                blurRadius: 10 + _controller.value * 10,
                spreadRadius: _controller.value * 3,
              ),
            ],
          ),
        );
      },
    );
  }
}