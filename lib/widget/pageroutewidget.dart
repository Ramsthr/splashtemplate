import 'package:flutter/material.dart';

PageRouteBuilder pageRouteBuilderFunction(Alignment alignment, Widget widget) {
  return PageRouteBuilder(
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        alignment: alignment,
        scale: Tween<double>(begin: 0.1, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          ),
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
  );
}
