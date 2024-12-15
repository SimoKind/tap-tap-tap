import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'tapGameLevel3.dart';

class TapPolygon extends BodyComponent<TapGameLevel3> with TapCallbacks {
  late PolygonComponent _visualPolygon;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Define the visual triangle's vertices (matches the physics body's shape)
    final vertices = [
      Vector2(-2.5, 2.5), // Bottom-left
      Vector2(2.5, 2.5), // Bottom-right
      Vector2(0, -2.5), // Top
    ];

    // Create the visual polygon component
    _visualPolygon = PolygonComponent(
      vertices,
      paint: Paint()
        ..shader = LinearGradient(
          colors: [Colors.red, Colors.orange],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTWH(0, 0, 5, 5)),
    );

    add(_visualPolygon);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape();
    shape.set([
      Vector2(-2.5, 2.5),
      Vector2(2.5, 2.5),
      Vector2(0, -2.5),
    ]);

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

    body.linearVelocity.setZero();
  }
}
