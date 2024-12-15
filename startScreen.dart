import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gameButton.dart';
import 'levelScreen.dart';
import 'gameScaffold.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
        Text("Welcome to the big", style: TextStyle(fontSize: 30)),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          "tap-tap-tap-game",
          style: TextStyle(fontSize: 48),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        Text(
          "Rules:",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "1. Tap the falling figures\n2. Be fast\n3. Get as many points as possible\n4. No cheating",
          style: TextStyle(fontSize: 14),
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        GameButton(
          text: "Start",
          onPressed: () {
            Get.put(LevelService());
            Get.to(() => LevelScreen());
          },
        ),
      ],
    );
  }
}
