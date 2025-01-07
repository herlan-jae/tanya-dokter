import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ConnectingScreen extends StatelessWidget {
  static const routeName = '/ConnectingScreen';

  const ConnectingScreen({super.key});

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/ChatSession');
            },
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
        ],
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
                    'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                  ),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 48.0),
          const Text(
            'Anda sedang dihubungkan dengan pasien ...',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36.0),
          const Text(
            'Lorenzo Hamza',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 42.0),
          const Text(
            'Anda akan terhubung dalam...',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.blue,
            ),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    '100',
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
