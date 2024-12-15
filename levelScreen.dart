import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gameButton.dart';
import 'gameButtonSmall.dart';
import 'gameScreen.dart';
import 'gameScreenLevel2.dart';
import 'gameScreenLevel3.dart';
import 'gameScaffold.dart';
import 'startScreen.dart';

class LevelService {
  final totalLevels = 3;
  final completedLevels = Set<int>();
  var currentLevel = 0;
}

class LevelScreen extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final levelService = Get.find<LevelService>();

  double screenWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    double smallBreakpoint = 500.0;
    double mediumBreakpoint = 800.0;

    if (screenWidth <= smallBreakpoint) {
      return _buildSmallLayout();
    } else if (screenWidth <= mediumBreakpoint) {
      return _buildMediumLayout();
    } else {
      return _buildLargeLayout();
    }
  }

  Widget _buildSmallLayout() {
    final levels = Iterable.generate(levelService.totalLevels).expand((level) {
      return [
        Padding(
          padding: EdgeInsets.all(14),
        ),
        GameButtonSmall(
          text: "Level ${level + 1}",
          onPressed: () {
            levelService.currentLevel = level;
            _navigateToLevel(level);
          },
        ),
      ];
    }).toList();

    return GameScaffold(content: [
      Text("Choose a level",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.blueAccent,
          )),
      Padding(padding: EdgeInsets.all(10)),
      ...levels,
      Padding(
        padding: EdgeInsets.all(50),
      ),
      GameButton(
        text: "Back to start",
        onPressed: () => Get.to(StartScreen()),
      ),
    ]);
  }

  Widget _buildMediumLayout() {
    final levels = Iterable.generate(levelService.totalLevels).expand((level) {
      return [
        Padding(
          padding: EdgeInsets.all(16),
        ),
        GameButtonSmall(
          text: "Level ${level + 1})",
          onPressed: () {
            levelService.currentLevel = level;
            _navigateToLevel(level);
          },
        ),
      ];
    }).toList();

    return GameScaffold(content: [
      Text("Choose a level",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.redAccent,
          )),
      ...levels,
      Padding(
        padding: EdgeInsets.all(16),
      ),
      GameButton(
        text: "Back to start",
        onPressed: () => Get.to(StartScreen()),
      ),
    ]);
  }

  Widget _buildLargeLayout() {
    final levels = Iterable.generate(levelService.totalLevels).expand((level) {
      return [
        Padding(
          padding: EdgeInsets.all(17),
        ),
        GameButtonSmall(
          text: "Level ${level + 1}",
          onPressed: () {
            levelService.currentLevel = level;
            _navigateToLevel(level);
          },
        ),
      ];
    }).toList();

    return GameScaffold(content: [
      Text("Choose a level",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: const Color.fromARGB(255, 13, 184, 10),
          )),
      ...levels,
      Padding(
        padding: EdgeInsets.all(25),
      ),
      GameButton(
        text: "Back to start",
        onPressed: () => Get.to(StartScreen()),
      ),
    ]);
  }

  void _navigateToLevel(int level) {
    if (level == 1) {
      Get.to(GameScreenLevel2());
    } else if (level == 2) {
      Get.to(GameScreenLevel3());
    } else {
      Get.to(GameScreen());
    }
  }
}
