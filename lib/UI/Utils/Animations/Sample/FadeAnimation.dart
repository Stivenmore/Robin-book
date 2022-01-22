// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final int delay;
  final Widget child;

  FadeAnimation(this.delay, this.child, {Key? key}) : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.delay),
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation = Tween(
      begin: -5.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: Transform.translate(
            offset: Offset(0, _animation.value), child: widget.child));
  }
}
