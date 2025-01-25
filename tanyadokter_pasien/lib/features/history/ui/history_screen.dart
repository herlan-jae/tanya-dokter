import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/history/widget/consultation_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Riwayat Konsultasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              ConsultationCard(
                date: '18 Oktober 2024',
                numberID: '#12345',
                patientName: 'Yusuf Abdul Wahid',
                doctorName: 'dr. Waleed Abu Kareem, S.um',
                symptom: 'Batuk pilek',
              ),
              ConsultationCard(
                date: '21 Oktober 2024',
                numberID: '#12345',
                patientName: 'Yusuf Abdul Wahid',
                doctorName: 'dr. Fatima',
                symptom: 'Sakit kepala',
              ),
              ConsultationCard(
                date: '27 Oktober 2024',
                numberID: '#12345',
                patientName: 'Yusuf Abdul Wahid',
                doctorName: 'dr. Tirto Sedoyo',
                symptom: 'Sakit perut',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
