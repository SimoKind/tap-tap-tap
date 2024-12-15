import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2_popthebaloon/gameButton.dart';
import 'startScreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Well done, you got $score points!",
                style: TextStyle(fontSize: 48)),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            GameButton(
              text: "Back to start",
              onPressed: () {
                Get.to(() => StartScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
