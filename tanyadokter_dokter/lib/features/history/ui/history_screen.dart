import 'package:flutter/material.dart';

import '../widget/history_card.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text(
          'Riwayat Pasien',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HistoryCard(
                  name: 'Lorenzo Hamza', gender: 'Pria', number: '08121121212'),
              HistoryCard(
                  name: 'Lorenzo Hamza', gender: 'Pria', number: '08121121212'),
              HistoryCard(
                  name: 'Lorenzo Hamza', gender: 'Pria', number: '08121121212'),
              HistoryCard(
                  name: 'Lorenzo Hamza', gender: 'Pria', number: '08121121212'),
            ],
          ),
        ),
      ),
    );
  }
}
