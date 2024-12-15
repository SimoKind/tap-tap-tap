import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'tapGameLevel2.dart'; 

class TapRectangle2 extends BodyComponent<TapGameLevel2> with TapCallbacks {
  late RectangleComponent _visualRectangle;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _visualRectangle = RectangleComponent(
      size: Vector2(10, 10),
      paint: Paint()
        ..shader = LinearGradient(
          colors: [const Color.fromARGB(255, 68, 192, 70), const Color.fromARGB(255, 78, 185, 206)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, 5, 5)),
    )
      ..anchor = Anchor.center;
    add(_visualRectangle);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.dynamic, 
      angularVelocity: 1.5, 
    );
    final shape = PolygonShape()..setAsBoxXY(5, 5);
    final fixtureDef = FixtureDef(shape);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.incrementScore(); 

    final gameRect = game.camera.visibleWorldRect;

    double randomX = Random().nextDouble() * (gameRect.width - 5) + gameRect.left;
    double randomY = Random().nextDouble() * (gameRect.height - 5) + gameRect.top;

    body.setTransform(Vector2(randomX, randomY), body.angle);

    body.linearVelocity.x = 0;
    body.linearVelocity.y = 0;
  }
}
