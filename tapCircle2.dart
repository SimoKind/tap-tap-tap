import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'dart:math';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import 'tapGameLevel2.dart';

class TapCircle2 extends BodyComponent<TapGameLevel2> with TapCallbacks {
  late CircleComponent _circleVisual;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _circleVisual = CircleComponent(
      radius: 2.5,
      paint: Paint()
        ..style = PaintingStyle.fill
        ..shader = LinearGradient(
          colors: [Colors.orange, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromCircle(center: Offset.zero, radius: 2.5)),
      anchor: Anchor.center,
    );

    add(_circleVisual);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = 2.5;
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
