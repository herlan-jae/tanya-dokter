import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';

class ConnectingScreen extends StatelessWidget {
  static const routeName = '/connect';

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
            onPressed: () async {
              final senderId = SessionHelper.getUserSession();
              String receiverId = '5';
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: {
                  'senderId': senderId,
                  'receiverId': receiverId,
                },
              );
            },
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 36.0),
          AvatarGlow(
            animate: true,
            duration: Duration(seconds: 3),
            glowColor: Colors.blue,
            glowRadiusFactor: 0.5,
            child: Material(
              elevation: 0.0,
              shape: CircleBorder(),
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
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                  ),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 36.0),
          Text(
            'Silakan menunggu beberapa saat, kami\nsedang menghubungkan Anda dengan...',
            style: TextStyle(fontSize: 10.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 36.0),
          Text(
            'dr. Waleed Abu Kareem, S.um',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            'Dokter Umum',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 42.0),
          Text(
            'Anda akan terhubung dalam...',
            style: TextStyle(fontSize: 10.0),
          ),
          SizedBox(height: 36.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    '100',
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
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
