import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'tapGameLevel3.dart';

class GameScreenLevel3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: TapGameLevel3(),
    );
  }
}