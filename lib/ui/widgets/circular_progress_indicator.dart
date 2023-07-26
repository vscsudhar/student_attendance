import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatefulWidget {
  final Color color;
  final Color backgroundColor;

  AnimatedCircularProgressIndicator({
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
  });

  @override
  _AnimatedCircularProgressIndicatorState createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends State<AnimatedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CircularProgressIndicator(
          value: _animation.value,
          color: widget.color,
          backgroundColor: widget.backgroundColor,
        );
      },
    );
  }
}

// // Usage:
// AnimatedCircularProgressIndicator(
//   color: Colors.white,
//   backgroundColor: Colors.grey,
// )
