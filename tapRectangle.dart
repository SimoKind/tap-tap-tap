import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'tapGame.dart';

class TapRectangle extends BodyComponent<TapGame> with TapCallbacks {
  late RectangleComponent _visualRectangle;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _visualRectangle = RectangleComponent(
      size: Vector2(15, 15),
      paint: Paint()
        ..shader = LinearGradient(
          colors: [Colors.blueAccent, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, 5 * 10, 5 * 10)),
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
    final shape = PolygonShape()..setAsBoxXY(7.5, 7.5);
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
