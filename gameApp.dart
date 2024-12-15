import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'startScreen.dart';

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tap tap tap",
      home: StartScreen(),
    );
  }
}
