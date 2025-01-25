// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/chat/views/ui/chat_screen.dart';

class ConnectingScreen extends StatefulWidget {
  static const routeName = '/connect';

  final String name;
  final String category;
  final String image;
  final String receiverId;

  const ConnectingScreen({
    super.key,
    required this.name,
    required this.category,
    required this.image,
    required this.receiverId,
  });

  @override
  _ConnectingScreenState createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  late Timer _countdownTimer;
  int _remainingSeconds = 5;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _countdownTimer.cancel();
        _navigateToChatScreen();
      }
    });
  }

  void _navigateToChatScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          receiverId: "5",
          isDoctor: false,
          name: widget.name,
          image: widget.image,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 36.0),
          AvatarGlow(
            animate: true,
            duration: const Duration(seconds: 3),
            glowColor: Colors.blue,
            glowRadiusFactor: 0.5,
            child: Material(
              elevation: 0.0,
              shape: const CircleBorder(),
              child: Container(
                width: 128.0,
                height: 128.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 4.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.image),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 36.0),
          const Text(
            'Silakan menunggu beberapa saat, kami\nsedang menghubungkan Anda dengan...',
            style: TextStyle(fontSize: 10.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36.0),
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            widget.category,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 42.0),
          const Text(
            'Anda akan terhubung dalam...',
            style: TextStyle(fontSize: 10.0),
          ),
          const SizedBox(height: 36.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    '$_remainingSeconds',
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                'detik',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
