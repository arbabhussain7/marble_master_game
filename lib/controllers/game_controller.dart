// import 'dart:async';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:marble_master/main.dart';
// import 'package:marble_master/models/marble_game_model.dart';

// class GameController extends GetxController {
//   final marbles = <Marble>[].obs;
//   final shootingMarbles = <Marble>[].obs;
//   final shooterAngle = (-math.pi / 2).obs;
//   final nextMarbleColor = Rx<Color>(Colors.red);
//   final score = 0.obs;
//   final isGameOver = false.obs;

//   late Timer gameTimer;
//   double spawnTimer = 0;
//   double spawnInterval = 60;
//   double marbleSpeed = 0.9;

//   final List<Color> marbleColors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.yellow,
//     Colors.purple,
//   ].map((color) => color is MaterialColor ? color.shade500 : color).toList();

//   @override
//   void onInit() {
//     super.onInit();
//     _initializeGame();
//   }

//   void _initializeGame() {
//     // Start with 5 marbles
//     for (int i = 0; i < 5; i++) {
//       marbles.add(
//         Marble(
//           color: marbleColors[math.Random().nextInt(marbleColors.length)],
//           position: i * 30.0,
//         ),
//       );
//     }

//     // Initialize next marble color
//     nextMarbleColor.value =
//         marbleColors[math.Random().nextInt(marbleColors.length)];

//     // Start game loop
//     gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
//       _updateGame();
//     });
//   }

//   void _updateGame() {
//     if (isGameOver.value) return;

//     // Update spawn timer
//     spawnTimer++;

//     // Spawn new marble when timer reaches interval
//     if (spawnTimer >= spawnInterval) {
//       _spawnNewMarble();
//       spawnTimer = 0;
//     }

//     // Move marbles along the path
//     for (var marble in marbles) {
//       marble.position += marbleSpeed;
//       if (marble.position > 1000) {
//         isGameOver.value = true;
//         return;
//       }
//     }

//     // Update shooting marbles
//     List<Marble> marblesToRemove = [];
//     for (var marble in shootingMarbles) {
//       marble.x += math.cos(marble.angle) * 25;
//       marble.y += math.sin(marble.angle) * 25;

//       // Check collisions
//       for (var pathMarble in marbles) {
//         final marblePos = _getMarblePosition(pathMarble.position);
//         final distance = math.sqrt(
//           math.pow(marble.x - marblePos.dx, 2) +
//               math.pow(marble.y - marblePos.dy, 2),
//         );

//         if (distance < 25) {
//           _handleCollision(marble);
//           marblesToRemove.add(marble);
//           break;
//         }
//       }

//       // Remove off-screen marbles
//       if (marble.x < 0 ||
//           marble.x > Get.width ||
//           marble.y < 0 ||
//           marble.y > Get.height) {
//         marblesToRemove.add(marble);
//       }
//     }

//     shootingMarbles.removeWhere((marble) => marblesToRemove.contains(marble));
//     update();
//   }

//   void _spawnNewMarble() {
//     // Shift existing marbles to make space
//     for (var marble in marbles) {
//       marble.position += 30;
//     }

//     // Add new marble at the start
//     marbles.insert(
//       0,
//       Marble(
//         color: marbleColors[math.Random().nextInt(marbleColors.length)],
//         position: 0,
//       ),
//     );
//   }

//   void _handleCollision(Marble shootingMarble) {
//     int insertIndex = _findInsertionIndex(shootingMarble);

//     marbles.insert(
//       insertIndex,
//       Marble(
//         color: shootingMarble.color,
//         position: _calculateInsertPosition(insertIndex),
//       ),
//     );

//     _checkAndRemoveMatches(insertIndex);
//   }

//   int _findInsertionIndex(Marble shootingMarble) {
//     int insertIndex = 0;
//     double minDistance = double.infinity;

//     for (int i = 0; i < marbles.length; i++) {
//       final pos = _getMarblePosition(marbles[i].position);
//       final distance = math.sqrt(
//         math.pow(shootingMarble.x - pos.dx, 2) +
//             math.pow(shootingMarble.y - pos.dy, 2),
//       );

//       if (distance < minDistance) {
//         minDistance = distance;
//         insertIndex = i;
//       }
//     }

//     return insertIndex;
//   }

//   double _calculateInsertPosition(int insertIndex) {
//     if (marbles.isEmpty) return 0;

//     if (insertIndex == 0) {
//       return marbles[0].position - 30;
//     } else if (insertIndex == marbles.length) {
//       return marbles[insertIndex - 1].position + 30;
//     } else {
//       return (marbles[insertIndex - 1].position +
//               marbles[insertIndex].position) /
//           2;
//     }
//   }

//   void _checkAndRemoveMatches(int insertIndex) {
//     Color insertedColor = marbles[insertIndex].color;
//     List<int> matchingIndices = [];

//     // Check backwards
//     int leftIndex = insertIndex;
//     while (leftIndex >= 0 && marbles[leftIndex].color == insertedColor) {
//       matchingIndices.add(leftIndex);
//       leftIndex--;
//     }

//     // Check forwards (skip insertIndex as it's already included)
//     int rightIndex = insertIndex + 1;
//     while (rightIndex < marbles.length &&
//         marbles[rightIndex].color == insertedColor) {
//       matchingIndices.add(rightIndex);
//       rightIndex++;
//     }

//     if (matchingIndices.length >= 3) {
//       matchingIndices.sort((a, b) => b.compareTo(a));

//       for (int index in matchingIndices) {
//         marbles.removeAt(index);
//       }

//       score.value += 100 * matchingIndices.length;
//       _adjustMarblePositions();
//     }
//   }

//   void _adjustMarblePositions() {
//     double spacing = 30.0;
//     for (int i = 0; i < marbles.length; i++) {
//       marbles[i].position = i * spacing;
//     }
//   }

//   void shootMarble(Offset tapPosition) {
//     if (isGameOver.value) return;

//     final shooterCenter = Offset(
//       Get.width / 2,
//       Get.height * 0.9,
//     );

//     final angle = (tapPosition - shooterCenter).direction;

//     shootingMarbles.add(Marble(
//       color: nextMarbleColor.value,
//       position: 0,
//       angle: angle,
//       x: shooterCenter.dx + math.cos(angle) * 40,
//       y: shooterCenter.dy + math.sin(angle) * 40,
//     ));

//     nextMarbleColor.value =
//         marbleColors[math.Random().nextInt(marbleColors.length)];
//   }

//   Offset _getMarblePosition(double position) {
//     final center = Offset(Get.width / 2, Get.height * 0.2);
//     final angle = position / 100;
//     final radius = 100 + angle * 20;

//     return Offset(
//       center.dx + radius * math.cos(angle),
//       center.dy + radius * math.sin(angle),
//     );
//   }

//   void restartGame() {
//     // Clear existing marbles
//     marbles.clear();
//     shootingMarbles.clear();

//     // Reset game variables
//     score.value = 0;
//     isGameOver.value = false;
//     spawnTimer = 0;

//     // Cancel existing timer
//     gameTimer.cancel();

//     // Reinitialize the game
//     _initializeGame();
//   }

//   @override
//   void onClose() {
//     gameTimer.cancel();
//     super.onClose();
//   }
// }
