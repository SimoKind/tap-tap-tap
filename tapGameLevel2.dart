import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';

import 'gameBoundsLevel2.dart';
import 'tapRectangle2.dart';
import 'tapCircle2.dart';

import 'resultScreen.dart';

class TapGameLevel2 extends Forge2DGame {
  var gameFinished = false;
  var timeLeft = 10.0;
  var score = 0;

  TapGameLevel2()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 800,
            height: 600,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    world.add(GameBoundsLevel2());
    world.add(TapRectangle2());
    world.add(TapCircle2());
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
