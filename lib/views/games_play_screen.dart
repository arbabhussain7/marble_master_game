import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marble_master/constants/assets.dart';
import 'package:marble_master/constants/colors.dart';
import 'package:marble_master/constants/styles.dart';
import 'package:marble_master/models/marble_game_model.dart';
import 'package:marble_master/widgets/custom_game_painter.dart';

import 'package:marble_master/widgets/custom_dialog_box.dart';
import 'package:marble_master/widgets/custom_reward_box.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  final List<Marble> marbles = [];
  final List<Marble> shootingMarbles = [];
  final List<HitEffect> hitEffects = [];
  double shooterAngle = -math.pi / 2;
  Color nextMarbleColor = Colors.red;
  int score = 20000;
  bool isGameOver = false;
  bool isPaused = false;
  late Timer gameTimer;
  int level = 50;

  // Image assets
  ImageProvider? backgroundImage;
  ImageProvider? hitEffectImage;
  ImageProvider? startEffectImage;

  // Spawn control variables
  double spawnTimer = 0;
  double spawnInterval = 60;
  double marbleSpeed = 0.2;

  final List<Color> marbleColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    _loadImages();
    _initializeGame();
  }

  Future<void> _loadImages() async {
    try {
      setState(() {
        backgroundImage = const AssetImage(ImageAssets.playGameBgImg);
        hitEffectImage = const AssetImage('assets/images/hit_effect.png');
        startEffectImage = const AssetImage('assets/images/start_effect.png');
      });
    } catch (e) {
      debugPrint('Error loading images: $e');
    }
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _restartGame() {
    setState(() {
      marbles.clear();
      shootingMarbles.clear();
      hitEffects.clear();
      score = 20000;
      level = 50;
      isGameOver = false;
      isPaused = false;
      spawnTimer = 0;
      gameTimer.cancel();
      _initializeGame();
    });
  }

  void _initializeGame() {
    for (int i = 0; i < 5; i++) {
      marbles.add(
        Marble(
          color: marbleColors[math.Random().nextInt(marbleColors.length)],
          position: i * 30.0,
        ),
      );
    }

    nextMarbleColor = marbleColors[math.Random().nextInt(marbleColors.length)];

    gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!isPaused) _updateGame();
    });
  }

  void _updateGame() {
    if (isGameOver) return;

    setState(() {
      spawnTimer++;

      // Update hit effects
      hitEffects.removeWhere((effect) {
        effect.opacity -= 0.05;
        effect.scale += 0.1;
        return effect.opacity <= 0;
      });

      if (spawnTimer >= spawnInterval) {
        _spawnNewMarble();
        spawnTimer = 0;
      }

      for (var marble in marbles) {
        marble.position += marbleSpeed;
        if (marble.position > 1000) {
          isGameOver = true;
          return;
        }
      }

      List<Marble> marblesToRemove = [];
      for (var marble in shootingMarbles) {
        marble.x += math.cos(marble.angle) * 25;
        marble.y += math.sin(marble.angle) * 25;

        for (var pathMarble in marbles) {
          final marblePos = _getMarblePosition(pathMarble.position);
          final distance = math.sqrt(
            math.pow(marble.x - marblePos.dx, 2) +
                math.pow(marble.y - marblePos.dy, 2),
          );

          if (distance < 25) {
            _handleCollision(marble);
            marblesToRemove.add(marble);
            break;
          }
        }

        if (marble.x < 0 ||
            marble.x > MediaQuery.of(context).size.width ||
            marble.y < 0 ||
            marble.y > MediaQuery.of(context).size.height) {
          marblesToRemove.add(marble);
        }
      }

      shootingMarbles.removeWhere((marble) => marblesToRemove.contains(marble));
    });
  }

  void _spawnNewMarble() {
    for (var marble in marbles) {
      marble.position += 30;
    }

    marbles.insert(
      0,
      Marble(
        color: marbleColors[math.Random().nextInt(marbleColors.length)],
        position: 0,
      ),
    );
  }

  void _handleCollision(Marble shootingMarble) {
    int insertIndex = _findInsertionIndex(shootingMarble);

    hitEffects.add(HitEffect(
      position: Offset(shootingMarble.x, shootingMarble.y),
    ));

    marbles.insert(
      insertIndex,
      Marble(
        color: shootingMarble.color,
        position: _calculateInsertPosition(insertIndex),
      ),
    );

    _checkAndRemoveMatches(insertIndex);
  }

  int _findInsertionIndex(Marble shootingMarble) {
    int insertIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < marbles.length; i++) {
      final pos = _getMarblePosition(marbles[i].position);
      final distance = math.sqrt(
        math.pow(shootingMarble.x - pos.dx, 2) +
            math.pow(shootingMarble.y - pos.dy, 2),
      );

      if (distance < minDistance) {
        minDistance = distance;
        insertIndex = i;
      }
    }

    return insertIndex;
  }

  double _calculateInsertPosition(int insertIndex) {
    if (marbles.isEmpty) return 0;

    if (insertIndex == 0) {
      return marbles[0].position - 30;
    } else if (insertIndex == marbles.length) {
      return marbles[insertIndex - 1].position + 30;
    } else {
      return (marbles[insertIndex - 1].position +
              marbles[insertIndex].position) /
          2;
    }
  }

  void _checkAndRemoveMatches(int insertIndex) {
    Color insertedColor = marbles[insertIndex].color;
    List<int> matchingIndices = [];

    int leftIndex = insertIndex;
    while (leftIndex >= 0 && marbles[leftIndex].color == insertedColor) {
      matchingIndices.add(leftIndex);
      leftIndex--;
    }

    int rightIndex = insertIndex + 1;
    while (rightIndex < marbles.length &&
        marbles[rightIndex].color == insertedColor) {
      matchingIndices.add(rightIndex);
      rightIndex++;
    }

    if (matchingIndices.length >= 3) {
      matchingIndices.sort((a, b) => b.compareTo(a));

      for (int index in matchingIndices) {
        marbles.removeAt(index);
      }

      score += 100 * matchingIndices.length;
      _adjustMarblePositions();
    }
  }

  void _adjustMarblePositions() {
    double spacing = 30.0;
    for (int i = 0; i < marbles.length; i++) {
      marbles[i].position = i * spacing;
    }
  }

  void _shootMarble(Offset tapPosition) {
    if (isGameOver || isPaused) return;

    final shooterCenter = Offset(
      MediaQuery.of(context).size.width / 2,
      MediaQuery.of(context).size.height * 0.45,
    );

    final angle = (tapPosition - shooterCenter).direction;

    shootingMarbles.add(Marble(
      color: nextMarbleColor,
      position: 0,
      angle: angle,
      x: shooterCenter.dx,
      y: shooterCenter.dy,
    ));

    setState(() {
      nextMarbleColor =
          marbleColors[math.Random().nextInt(marbleColors.length)];
    });
  }

  Offset _getMarblePosition(double position) {
    final size = MediaQuery.of(context).size;
    final pathLength = _calculatePathLength();
    final t = (position % pathLength) / pathLength;
    return _getPointOnPath(t, size);
  }

  double _calculatePathLength() {
    return 1000;
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
  void dispose() {
    gameTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primaryColor,
                        width: 8.w,
                      ),
                    ),
                    color: AppColors.secondaryColor,
                    image: const DecorationImage(
                      image: AssetImage(ImageAssets.appBarImg),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _togglePause(); // First pause the game
                          Get.dialog(
                            CustomDialogBox(
                              onResume:
                                  _togglePause, // Pass the toggle function to resume
                              onRestart:
                                  _restartGame, // Pass the restart function
                            ),
                          ).then((_) {
                            // When dialog is closed without using buttons, resume the game
                            if (isPaused) {
                              _togglePause();
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonGradient,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: SvgPicture.asset(
                            ImageAssets.pauseIcon,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(CustomRewardBox());
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              width: 86.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22.r),
                                child: const LinearProgressIndicator(
                                  value: 0.7,
                                  backgroundColor: AppColors.cBrownColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.maxYellowColor,
                                  ),
                                  minHeight: 7,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(ImageAssets.coinIcon),
                                SizedBox(width: 6.w),
                                Text(
                                  score.toString(),
                                  style:
                                      TextStyles.leaderBoardTextStyle.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.3),
                          offset: const Offset(-7, 0),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.3),
                          offset: const Offset(7, 0),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                      color: AppColors.secondaryColor,
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primaryColor,
                          width: 8.w,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 17.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          level.toString(),
                          style: TextStyles.buttonTextStyle.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          width: 106.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(22.r),
                            child: LinearProgressIndicator(
                              value: level / 100,
                              backgroundColor: AppColors.cBrownColor,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.maxYellowColor,
                              ),
                              minHeight: 7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTapUp: (details) {
                  if (!isPaused && !isGameOver) {
                    _shootMarble(details.localPosition);
                  }
                },
                child: CustomPaint(
                  painter: GamePainter(
                    marbles: marbles,
                    shootingMarbles: shootingMarbles,
                    hitEffects: hitEffects,
                    shooterAngle: shooterAngle,
                    nextMarbleColor: nextMarbleColor,
                    score: score,
                    level: level,
                    isGameOver: isGameOver,
                    isPaused: isPaused,
                    backgroundImage: backgroundImage,
                    hitEffectImage: hitEffectImage,
                    startEffectImage: startEffectImage,
                  ),
                  size: Size.infinite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
