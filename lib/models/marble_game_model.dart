// lib/models/marble_game_model.dart
import 'package:flutter/material.dart';

class Marble {
  final Color color;
  double position;
  double angle;
  double x;
  double y;

  Marble({
    required this.color,
    required this.position,
    this.angle = 0,
    this.x = 0,
    this.y = 0,
  });
}

class HitEffect {
  final Offset position;
  double opacity;
  double scale;

  HitEffect({
    required this.position,
    this.opacity = 1.0,
    this.scale = 1.0,
  });
}
