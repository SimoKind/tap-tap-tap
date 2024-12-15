import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'tapGameLevel3.dart';

class tapRectangle3 extends BodyComponent<TapGameLevel3> with TapCallbacks {
  late RectangleComponent _visualRectangle;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _visualRectangle = RectangleComponent(
      size: Vector2(5, 5),
      paint: Paint()
        ..shader = LinearGradient(
          colors: [
            const Color.fromARGB(255, 229, 72, 250),
            const Color.fromARGB(255, 101, 18, 234)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, 5, 5)),
    )..anchor = Anchor.center;
    add(_visualRectangle);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.dynamic,
      angularVelocity: 1.5,
    );
    final shape = PolygonShape()..setAsBoxXY(2.5, 2.5);
    final fixtureDef = FixtureDef(shape);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.incrementScore();
    final gameRect = game.camera.visibleWorldRect;

    double randomX =
        Random().nextDouble() * (gameRect.width - 5) + gameRect.left;
    double randomY =
        Random().nextDouble() * (gameRect.height - 5) + gameRect.top;

    body.setTransform(Vector2(randomX, randomY), body.angle);

    body.linearVelocity.x = 0;
    body.linearVelocity.y = 0;
  }
}
