import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final String gender;
  final String number;

  const HistoryCard({
    super.key,
    required this.name,
    required this.gender,
    required this.number,
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
              'Chat Berakhir',
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
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2018/04/27/03/50/portrait-3353699_1280.jpg'),
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
                        const SizedBox(height: 4.0),
                        Text(
                          number,
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
                  const Expanded(
                    child: Text(
                      'Chat berakhir pada 28-10-2024 13:20',
                      style:
                          TextStyle(fontSize: 8.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/history-detail');
                      },
                      icon: const Icon(
                        Icons.history,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Lihat Riwayat',
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
