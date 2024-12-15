import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'tapGameLevel2.dart';

class GameScreenLevel2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: TapGameLevel2(),
    );
  }
}
