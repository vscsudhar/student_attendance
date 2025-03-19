import 'package:flutter/material.dart';

class SlideTranse extends StatefulWidget {
  final Widget child;
  final Color color;

  const SlideTranse(
      {required this.child, this.color = Colors.transparent, Key? key})
      : super(key: key);

  @override
  State<SlideTranse> createState() => _SlideTranseState();
}

class _SlideTranseState extends State<SlideTranse>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _animationb = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward(); // Start the animation when the widget is built
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Stack(
        children: [
          SizeTransition(
            sizeFactor: _animationb,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
