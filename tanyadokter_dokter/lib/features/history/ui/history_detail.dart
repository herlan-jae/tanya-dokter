import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  static const routeName = '/history-detail';
  const HistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Obat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Color(0xFFDDF2FF),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 36.0),
                      Stack(
                        children: [
                          Container(
                            width: 78,
                            height: 78,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF116487),
                                width: 3,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 36,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yusuf Abdul Wahid',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Pria',
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                          Text(
                            '081811881818',
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Color(0xFFDDF2FF),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.sick_outlined),
                                SizedBox(width: 8.0),
                                Text('Keluhan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Batuk pilek disertai gejala demam',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.0),
                            Divider(color: Color(0xFF116487), thickness: 0.3),
                            SizedBox(height: 12.0),
                            Row(
                              children: [
                                Icon(Icons.medication_rounded),
                                SizedBox(width: 8.0),
                                Text('Resep Obat',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Paracetamol dosis Dewasa 3x sehari sesudah makan.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Ambroxol dosis Dewasa 3x sehari sesudah makan.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.0),
                            Divider(color: Color(0xFF116487), thickness: 0.3),
                            SizedBox(height: 12.0),
                            Row(
                              children: [
                                Icon(Icons.edit_note),
                                SizedBox(width: 8.0),
                                Text('Catatan Dokter',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Jika batuk masih berlanjut, perlu diganti resep obat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        shadowColor: Colors.black,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: const Color(0xFFDDF2FF),
              foregroundColor: const Color(0xFF116487),
              minimumSize: const Size(370.0, 30.0)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Kembali',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
