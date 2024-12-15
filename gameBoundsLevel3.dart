import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'tapGameLevel3.dart';

class GameBoundsLevel3 extends BodyComponent<TapGameLevel3> {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
    );

    Body gameBoundsBody = world.createBody(bodyDef);
    final gameRect = game.camera.visibleWorldRect;

    final gameBoundsVectors = [
      Vector2(gameRect.left, gameRect.top),
      Vector2(gameRect.right, gameRect.top),
      Vector2(gameRect.right, gameRect.bottom),
      Vector2(gameRect.left, gameRect.bottom),
    ];

    for (int i = 0; i < gameBoundsVectors.length; i++) {
      gameBoundsBody.createFixture(FixtureDef(
        EdgeShape()
          ..set(
            gameBoundsVectors[i],
            gameBoundsVectors[(i + 1) % gameBoundsVectors.length],
          ),
      ));
    }

    return gameBoundsBody;
  }
}
