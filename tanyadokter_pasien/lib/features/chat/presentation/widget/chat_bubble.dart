import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
