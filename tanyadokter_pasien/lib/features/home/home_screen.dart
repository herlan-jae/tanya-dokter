import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

List<Image> bannerImage = [
  Image.network(
    'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
    height: 140.0,
    width: 230.0,
    fit: BoxFit.cover,
  ),
  Image.network(
    'https://static.vecteezy.com/system/resources/previews/003/623/626/non_2x/sunset-lake-landscape-illustration-free-vector.jpg',
    height: 140.0,
    width: 230.0,
    fit: BoxFit.cover,
  ),
];

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  'Halo, Yusuf Abdul Wahid!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  height: size.height * 0.18,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: bannerImage[index],
                      );
                    },
                    itemCount: bannerImage.length,
                    pagination: const SwiperPagination(),
                    viewportFraction: 0.8,
                    autoplay: true,
                    scale: 0.9,
                  ),
                ),
                const SizedBox(height: 18.0),
                const MainBanner(
                  title: 'Konsultasikan keluhan Anda',
                  image:
                      'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
                ),
                const SizedBox(height: 18.0),
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
                    backgroundColor: Color(0xFFD7F0FF),
                  ),
                  child: const Text(
                    'Mulai Konsultasi Sekarang',
                    style: TextStyle(color: Color(0xFF116487), fontWeight: FontWeight.bold),
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

class MainBanner extends StatelessWidget {
  final String title;
  final String image;

  const MainBanner({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.0,
          ),
        ),
        const SizedBox(height: 12.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            image,
            height: size.height * 0.2,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
