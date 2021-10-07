import 'package:flutter/material.dart';

class Dot {
  final int index;
  final double velocity;
  final double startingDxFactor;
  final double startingDyFactor;
  final int height;

  const Dot({
    required this.index,
    required this.velocity,
    required this.startingDxFactor,
    required this.startingDyFactor,
    required this.height,
  });

  Dot copyWith({
    int? index,
    double? velocity,
    double? startingDxFactor,
    double? startingDyFactor,
    int? height,
  }) {
    return Dot(
      index: index ?? this.index,
      velocity: velocity ?? this.velocity,
      startingDxFactor: startingDxFactor ?? this.startingDxFactor,
      startingDyFactor: startingDyFactor ?? this.startingDyFactor,
      height: height ?? this.height,
    );
  }
}
