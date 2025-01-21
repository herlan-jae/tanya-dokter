import 'package:flutter/material.dart';

class QueueCard extends StatelessWidget {
  final String name;
  final String gender;

  const QueueCard({
    super.key,
    required this.name,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.info,
              size: 16.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Menunggu respon',
              style: TextStyle(fontSize: 8.0),
            )
          ],
        ),
        const SizedBox(height: 12.0),
        Container(
          width: 370.0,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color(0xFFDDF2FF),
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF116487),
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          gender,
                          style: const TextStyle(fontSize: 11.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/ConnectingScreen');
                      },
                      icon: const Icon(
                        Icons.chat,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Mulai Chat',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: const Color(0xFF116487),
                        foregroundColor: const Color(0xFFDDF2FF),
                        minimumSize: const Size(100.0, 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.hourglass_top_rounded,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Tunda',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: const Color(0xFF116487),
                        foregroundColor: const Color(0xFFDDF2FF),
                        minimumSize: const Size(100.0, 30.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        const Divider(color: Colors.grey),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
