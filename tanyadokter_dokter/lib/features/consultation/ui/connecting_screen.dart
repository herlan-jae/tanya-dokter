import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/features/chat/views/ui/chat_screen.dart';

class ConnectingScreen extends StatefulWidget {
  static const routeName = '/connect';
  final String name;

  const ConnectingScreen({
    super.key,
    required this.name,
  });

  @override
  State<ConnectingScreen> createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  late Timer countdownTimer;
  int remainingSeconds = 5;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        countdownTimer.cancel();
        navigateToChatScreen();
      }
    });
  }

  void navigateToChatScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          receiverId: "4",
          isPatient: true,
          name: widget.name,
          image:
              'https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699_1280.jpg',
        ),
      ),
    );
  }

  @override
  void dispose() {
    countdownTimer.cancel();
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
            duration: const Duration(seconds: 2),
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
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699_1280.jpg',
                  ),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 48.0),
          const Text(
            'Anda sedang dihubungkan dengan pasien ...',
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
                    '$remainingSeconds',
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
