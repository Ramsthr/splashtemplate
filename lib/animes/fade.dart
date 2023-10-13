import 'package:flutter/material.dart';

class FadeInWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  FadeInWidget({
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
