import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';

import 'tapRectangle.dart';
import 'gameBounds.dart';

import 'resultScreen.dart';

class TapGame extends Forge2DGame {
  var gameFinished = false;
  var timeLeft = 10.0;
  var score = 0;

  TapGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 800,
            height: 600,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    world.add(GameBounds());
    world.add(TapRectangle());
  }

  @override
  void update(double dt) {
    super.update(dt);
    timeLeft -= dt;

    if (timeLeft <= 0 && !gameFinished) {
      gameFinished = true;
      Get.offAll(() => ResultScreen(score: score));
    }
  }

  incrementScore() {
    score++;
  }
}
