import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/features/dashboard/widget/main_banner.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  Future<String> getUserName() async {
    final session = await SessionHelper.getUserSession();
    return session["fullname"] ?? "Guest";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUserName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      'Halo, ${snapshot.data}!',
                      style: const TextStyle(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
