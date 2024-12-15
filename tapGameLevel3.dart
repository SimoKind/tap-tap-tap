import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';

import 'gameBoundsLevel3.dart';
import 'tapRectangle3.dart';
import 'tapCircle3.dart';
import 'tapPolygon.dart';

import 'resultScreen.dart';

class TapGameLevel3 extends Forge2DGame {
  var gameFinished = false;
  var timeLeft = 10.0;
  var score = 0;

  TapGameLevel3()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 800,
            height: 600,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    world.add(GameBoundsLevel3());
    world.add(tapRectangle3());
    world.add(TapCircle3());
    world.add(TapPolygon());
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
