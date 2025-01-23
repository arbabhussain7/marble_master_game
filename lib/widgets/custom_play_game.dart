// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:marble_master/helper/play_game_helper.dart';
// import 'package:marble_master/models/marble_game_model.dart';

// class GamePainter extends CustomPainter {
//   final List<Marble> marbles;
//   final List<Marble> shootingMarbles;
//   final double shooterAngle;
//   final Color nextMarbleColor;
//   final int score;
//   final bool isGameOver;

//   GamePainter({
//     required this.marbles,
//     required this.shootingMarbles,
//     required this.shooterAngle,
//     required this.nextMarbleColor,
//     required this.score,
//     required this.isGameOver,
//     required List<HitEffect> hitEffects,
//     required int level,
//     required bool isPaused,
//     ImageProvider<Object>? backgroundImage,
//     ImageProvider<Object>? hitEffectImage,
//     ImageProvider<Object>? startEffectImage,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height * 0.2);

//     // Draw background
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       Paint()..color = Colors.green[800]!,
//     );

//     // Draw spiral path
//     final pathPaint = Paint()
//       ..color = Colors.brown
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 30;

//     final path = Path();
//     for (double i = 0; i < 2 * math.pi * 2; i += 0.1) {
//       final radius = 100 + i * 20;
//       final x = center.dx + radius * math.cos(i);
//       final y = center.dy + radius * math.sin(i);

//       if (i == 0) {
//         path.moveTo(x, y);
//       } else {
//         path.lineTo(x, y);
//       }
//     }
//     canvas.drawPath(path, pathPaint);

//     // Draw path marbles
//     for (final marble in marbles) {
//       final position = _getMarblePosition(marble.position, center);
//       canvas.drawCircle(
//         position,
//         15,
//         Paint()..color = marble.color,
//       );
//     }

//     // Draw shooting marbles
//     for (final marble in shootingMarbles) {
//       canvas.drawCircle(
//         Offset(marble.x, marble.y),
//         15,
//         Paint()..color = marble.color,
//       );
//     }

//     // Draw shooter
//     final shooterCenter = Offset(size.width / 2, size.height * 0.9);
//     canvas.save();
//     canvas.translate(shooterCenter.dx, shooterCenter.dy);
//     canvas.rotate(shooterAngle);

//     final shooterPaint = Paint()..color = Colors.grey[800]!;
//     canvas.drawRect(
//       Rect.fromLTWH(-10, -40, 20, 40),
//       shooterPaint,
//     );

//     // Draw next marble
//     canvas.drawCircle(
//       const Offset(0, -60),
//       15,
//       Paint()..color = nextMarbleColor,
//     );

//     canvas.restore();

//     // Draw score
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: 'Score: $score',
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(canvas, const Offset(20, 20));

//     // Draw game over message
//     if (isGameOver) {
//       final gameOverPainter = TextPainter(
//         text: TextSpan(
//           text: marbles.isEmpty ? 'You Win!' : 'Game Over!',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 48,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         textDirection: TextDirection.ltr,
//       );
//       gameOverPainter.layout();
//       gameOverPainter.paint(
//         canvas,
//         Offset(
//           (size.width - gameOverPainter.width) / 2,
//           (size.height - gameOverPainter.height) / 2,
//         ),
//       );
//     }
//   }

//   Offset _getMarblePosition(double position, Offset center) {
//     final angle = position / 100;
//     final radius = 100 + angle * 20;
//     return Offset(
//       center.dx + radius * math.cos(angle),
//       center.dy + radius * math.sin(angle),
//     );
//   }

//   @override
//   bool shouldRepaint(GamePainter oldDelegate) => true;
// }
