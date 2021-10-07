import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rain_animation/dot.dart';
import 'dart:developer' as dev;

class DotsPainter extends CustomPainter {
  final double animationValue;

  DotsPainter(this.animationValue, this.dots);

  final List<Dot> dots;

  @override
  void paint(Canvas canvas, Size size) {
    _drawDots(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawRainDot(Canvas canvas, Size size, Dot dot) {
    double dy = (size.height * animationValue * dot.velocity).clamp(0, size.height);

    dy = mapValueToFit(dy, 0, size.height, -size.height * 0.2, size.height * 1.1);

    Offset upperCenterPoint = Offset(
      size.width * dot.startingDxFactor,
      dy,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          upperCenterPoint.dx - 2.5,
          upperCenterPoint.dy,
          5,
          dot.height.toDouble(),
        ),
        const Radius.circular(10),
      ),
      Paint()..color = Colors.red,
    );
  }

  void _drawDots(Canvas canvas, Size size) {
    for (int i = 0; i < dots.length; i++) {
      _drawRainDot(canvas, size, dots[i]);
    }
  }

  double mapValueToFit(double x, double inMin, double inMax, double outMin, double outMax) {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }
}
