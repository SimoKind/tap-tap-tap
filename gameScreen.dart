import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'tapGame.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: TapGame(),
    );
  }
}
