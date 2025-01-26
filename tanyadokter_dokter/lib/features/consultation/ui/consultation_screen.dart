import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/features/consultation/ui/connecting_screen.dart';
import 'package:tanyadokter_dokter/features/consultation/widget/queue_card.dart';

class ConsultationScreen extends StatelessWidget {
  static const routeName = '/consultation';
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text(
          'Antrian Konsultasi Pasien',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QueueCard(
                name: 'Lorenzo Hamza',
                gender: 'Pria',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectingScreen(
                        name: "Lorenzo Hamza",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
