import 'package:flutter/material.dart';

class GameButtonSmall extends StatefulWidget {
  final String text;
  final Function onPressed;

  const GameButtonSmall({required this.text, required this.onPressed});

  @override
  _GameButtonSmallState createState() => _GameButtonSmallState();
}

class _GameButtonSmallState extends State<GameButtonSmall> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
        onPressed: () => widget.onPressed(),
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 27, 83, 87),
          ),
        ),
      ),
    );
  }
}
