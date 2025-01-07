import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  const TitleTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xFF41B6FF),
      ),
    );
  }
}
