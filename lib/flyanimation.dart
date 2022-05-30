import 'package:flutter/material.dart';

class FlyAnimation extends StatefulWidget {
  const FlyAnimation({required this.animate, required this.child, Key? key})
      : super(key: key);
  final Widget child;
  final bool animate;
  @override
  State<FlyAnimation> createState() => _FlyAnimationState();
}

class _FlyAnimationState extends State<FlyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlyAnimation oldWidget) {
    if (widget.animate && _controller.isAnimating) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
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
        builder: (context, child) => RotationTransition(
              turns: _controller,
              child: widget.child,
            ));
  }
}
