import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/features/consultation/widget/queue_card.dart';

class ConsultationScreen extends StatelessWidget {
  static const routeName = '/ConsultationScreen';
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Antrian Konsultasi Pasien',
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
              QueueCard(name: 'Lorenzo Hamza', gender: 'Pria'),
              QueueCard(name: 'Yusuf Abdul Wahid', gender: 'Pria'),
              QueueCard(name: 'Putri Kusuma', gender: 'Wanita'),
            ],
          ),
        ),
      ),
    );
  }
}


