import 'package:flutter/material.dart';

class ConsultationCard extends StatelessWidget {
  final String date;
  final String numberID;
  final String patientName;
  final String doctorName;
  final String symptom;

  const ConsultationCard({
    super.key,
    required this.date,
    required this.numberID,
    required this.patientName,
    required this.doctorName,
    required this.symptom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 11),
            ),
            Text(
              numberID,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          width: double.infinity,
          child: Card(
            color: Color(0xFFDDF2FF),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Pasien',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    patientName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const Divider(
                    color: Color(0xFF116487),
                    thickness: 0.1,
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Nama Dokter',
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  const Divider(
                    color: Color(0xFF116487),
                    thickness: 0.1,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Keluhan',
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            symptom,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.print_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Lihat Resep',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF116487),
                          foregroundColor: Color(0xFFDDF2FF),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Prescription');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        const Divider(
          color: Colors.grey,
          thickness: 0.1,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
