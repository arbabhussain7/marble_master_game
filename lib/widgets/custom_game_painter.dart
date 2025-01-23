import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:marble_master/models/marble_game_model.dart';
// If you need play_game_helper.dart, import it with a prefix

class GamePainter extends CustomPainter {
  final List<Marble> marbles;
  final List<Marble> shootingMarbles;
  final List<HitEffect> hitEffects;
  final double shooterAngle;
  final Color nextMarbleColor;
  final int score;
  final int level;
  final bool isGameOver;
  final bool isPaused;
  final ImageProvider? backgroundImage;
  final ImageProvider? hitEffectImage;
  final ImageProvider? startEffectImage;

  GamePainter({
    required this.marbles,
    required this.shootingMarbles,
    required this.hitEffects,
    required this.shooterAngle,
    required this.nextMarbleColor,
    required this.score,
    required this.level,
    required this.isGameOver,
    required this.isPaused,
    this.backgroundImage,
    this.hitEffectImage,
    this.startEffectImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawPath(canvas, size);
    _drawDecorations(canvas, size);
    _drawMarbles(canvas, size);
    _drawHitEffects(canvas, size);
    _drawShooter(canvas, size);
    // _drawUI(canvas, size);

    if (isPaused) _drawPauseOverlay(canvas, size);
    if (isGameOver) _drawGameOver(canvas, size);
  }

  void _drawBackground(Canvas canvas, Size size) {
    // Default background if image is not loaded
    Paint backgroundPaint = Paint()..color = const Color(0xFF1B5E20);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Add decorative elements
    final random = math.Random(42);
    final detailPaint = Paint()
      ..color = const Color(0xFF2E7D32).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 200; i++) {
      canvas.drawCircle(
        Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        ),
        2,
        detailPaint,
      );
    }
  }

  void _drawDecorations(Canvas canvas, Size size) {
    // Draw stones at the sides
    final stonePaint = Paint()..color = Colors.grey[700]!;
    canvas.drawCircle(
      Offset(0, size.height * 0.7),
      50,
      stonePaint,
    );
    canvas.drawCircle(
      Offset(size.width, size.height * 0.7),
      50,
      stonePaint,
    );

    // Draw bushes
    _drawBush(canvas, Offset(size.width * 0.15, size.height * 0.2));
    _drawBush(canvas, Offset(size.width * 0.85, size.height * 0.2));
  }

  void _drawBush(Canvas canvas, Offset position) {
    final bushPaint = Paint()..color = const Color(0xFF0B3E0B);
    canvas.drawCircle(position, 25, bushPaint);

    final highlightPaint = Paint()..color = const Color(0xFF1B5E20);
    canvas.drawCircle(
      position.translate(-8, -8),
      10,
      highlightPaint,
    );
  }

  void _drawPath(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.45);
    final radiusX = size.width * 0.35;
    final radiusY = size.height * 0.3;

    final path = Path()
      ..addOval(Rect.fromCenter(
        center: center,
        width: radiusX * 2,
        height: radiusY * 2,
      ));

    // Draw path border
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.brown[800]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 44,
    );

    // Draw main path
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.brown[600]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 40,
    );

    // Add path texture
    final stonePaint = Paint()
      ..color = Colors.brown[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (double t = 0; t < 1; t += 0.05) {
      final angle = 2 * math.pi * t;
      final x = center.dx + radiusX * math.cos(angle);
      final y = center.dy + radiusY * math.sin(angle);

      final normalAngle = angle + math.pi / 2;
      canvas.drawLine(
        Offset(x - 15 * math.cos(normalAngle), y - 15 * math.sin(normalAngle)),
        Offset(x + 15 * math.cos(normalAngle), y + 15 * math.sin(normalAngle)),
        stonePaint,
      );
    }
  }

  void _drawMarbles(Canvas canvas, Size size) {
    // Draw path marbles
    for (final marble in marbles) {
      final position = _getPointOnPath(marble.position / 1000, size);
      _drawMarble(canvas, position, marble.color);
    }

    // Draw shooting marbles
    for (final marble in shootingMarbles) {
      _drawMarble(canvas, Offset(marble.x, marble.y), marble.color);
    }
  }

  void _drawMarble(Canvas canvas, Offset position, Color color) {
    // Base marble
    canvas.drawCircle(
      position,
      15,
      Paint()..color = color,
    );

    // Shine effect
    canvas.drawCircle(
      position.translate(-5, -5),
      5,
      Paint()
        ..color = Colors.white.withOpacity(0.5)
        ..style = PaintingStyle.fill,
    );

    // Edge highlight
    canvas.drawCircle(
      position,
      15,
      Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  void _drawHitEffects(Canvas canvas, Size size) {
    for (var effect in hitEffects) {
      // Inner glow
      canvas.drawCircle(
        effect.position,
        20 * effect.scale,
        Paint()
          ..color = Colors.white.withOpacity(effect.opacity * 0.5)
          ..style = PaintingStyle.fill,
      );

      // Outer ring
      canvas.drawCircle(
        effect.position,
        30 * effect.scale,
        Paint()
          ..color = Colors.white.withOpacity(effect.opacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );
    }
  }

  void _drawShooter(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.45);

    // Draw shooter base
    canvas.drawCircle(
      center,
      40,
      Paint()..color = Colors.brown[900]!,
    );

    // Draw shooter platform
    canvas.drawCircle(
      center,
      35,
      Paint()..color = Colors.brown[700]!,
    );

    // Draw next marble
    canvas.drawCircle(
      center,
      15,
      Paint()..color = nextMarbleColor,
    );

    // Add shine effect to next marble
    canvas.drawCircle(
      center.translate(-5, -5),
      5,
      Paint()
        ..color = Colors.white.withOpacity(0.5)
        ..style = PaintingStyle.fill,
    );

    // Draw pulsing effect
    canvas.drawCircle(
      center,
      45,
      Paint()
        ..color = Colors.white.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  // void _drawUI(Canvas canvas, Size size) {
  //   // Score display
  //   final scoreText = TextPainter(
  //     text: TextSpan(
  //       text: 'Score: $score',
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontSize: 24,
  //         fontWeight: FontWeight.bold,
  //         shadows: [
  //           Shadow(
  //             offset: Offset(2, 2),
  //             blurRadius: 2,
  //             color: Colors.black,
  //           ),
  //         ],
  //       ),
  //     ),
  //     textDirection: TextDirection.ltr,
  //   )..layout();

  //   scoreText.paint(
  //     canvas,
  //     Offset(20, 20),
  //   );

  //   // Level progress bar
  //   final progressRect = RRect.fromRectAndRadius(
  //     Rect.fromLTWH(
  //       size.width * 0.2,
  //       50,
  //       size.width * 0.6,
  //       20,
  //     ),
  //     const Radius.circular(10),
  //   );

  //   // Background
  //   canvas.drawRRect(
  //     progressRect,
  //     Paint()..color = Colors.grey[800]!,
  //   );

  //   // Progress
  //   canvas.drawRRect(
  //     RRect.fromRectAndRadius(
  //       Rect.fromLTWH(
  //         size.width * 0.2,
  //         50,
  //         size.width * 0.6 * (level / 100),
  //         20,
  //       ),
  //       const Radius.circular(10),
  //     ),
  //     Paint()..color = Colors.orange,
  //   );

  //   // Level number
  //   final levelText = TextPainter(
  //     text: TextSpan(
  //       text: 'Level $level',
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //         shadows: [
  //           Shadow(
  //             offset: Offset(1, 1),
  //             blurRadius: 2,
  //             color: Colors.black,
  //           ),
  //         ],
  //       ),
  //     ),
  //     textDirection: TextDirection.ltr,
  //   )..layout();

  //   levelText.paint(
  //     canvas,
  //     Offset(
  //       size.width * 0.5 - levelText.width / 2,
  //       20,
  //     ),
  //   );
  // }

  void _drawPauseOverlay(Canvas canvas, Size size) {
    // Semi-transparent overlay
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.black.withOpacity(0.5),
    );

    // Pause text
    final pauseText = TextPainter(
      text: const TextSpan(
        text: 'PAUSED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: Colors.black,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    pauseText.paint(
      canvas,
      Offset(
        (size.width - pauseText.width) / 2,
        (size.height - pauseText.height) / 2,
      ),
    );
  }

  void _drawGameOver(Canvas canvas, Size size) {
    // Semi-transparent overlay
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.black.withOpacity(0.7),
    );

    // Game over text
    final gameOverText = TextPainter(
      text: const TextSpan(
        text: 'GAME OVER',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: Colors.black,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    gameOverText.paint(
      canvas,
      Offset(
        (size.width - gameOverText.width) / 2,
        (size.height - gameOverText.height) / 2,
      ),
    );

    // Score display
    final finalScoreText = TextPainter(
      text: TextSpan(
        text: 'Final Score: $score',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    finalScoreText.paint(
      canvas,
      Offset(
        (size.width - finalScoreText.width) / 2,
        (size.height - gameOverText.height) / 2 + 80,
      ),
    );
  }

  Offset _getPointOnPath(double t, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.45);
    final radiusX = size.width * 0.35;
    final radiusY = size.height * 0.3;

    final angle = 2 * math.pi * t - math.pi / 2;
    return Offset(
      center.dx + radiusX * math.cos(angle),
      center.dy + radiusY * math.sin(angle),
    );
  }

  @override
  bool shouldRepaint(GamePainter oldDelegate) => true;
}
