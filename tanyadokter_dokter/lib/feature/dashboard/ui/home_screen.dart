import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/feature/dashboard/widget/main_banner.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0),
                const Text(
                  'Halo, dr. Waleed!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const Text(
                  'Apa yang ingin Anda lakukan?',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                const MainBanner(
                  title: 'Atur antrian konsultasi pasien',
                  image:
                      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                ),
                const MainBanner(
                  title: 'Dapatkan resep obat langsung',
                  image:
                      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                ),
                const MainBanner(
                  title: 'Dapatkan resep obat langsung',
                  image:
                      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                ),
                const MainBanner(
                  title: 'Dapatkan resep obat langsung',
                  image:
                      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                ),
                const SizedBox(height: 18.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0),
                    backgroundColor: const Color(0xFFD7F0FF),
                    elevation: 0.0,
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Color(0xFF116487),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
