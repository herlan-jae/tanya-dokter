import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                // Text(
                //   'Kelompok 1',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 24.0,
                //   ),
                // ),
                // SizedBox(
                //   height: 18.0,
                // ),
                Text(
                  'Aplikasi ini dibangun sebagai tugas akhir Mata Kuliah Rekayasa Perangkat Lunak (CSF311) Teknik Informatika Fakultas Ilmu Komputer Universitas Esa Unggul.',
                ),
                SizedBox(height: 18.0),
                Text(
                  'Aplikasi ini merupakan sebuah aplikasi layanan kesehatan yang menyediakan layanan konsultasi antara pasien dan dokter secara langsung melalui chat. Dokter juga dapat memberikan resep kepada pasien sesuai dengan hasil diagnosa yang dilakukan.',
                ),
                SizedBox(height: 18.0),
                Text(
                  'Kami akan terus berusaha menyempurnakan aplikasi ini.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
