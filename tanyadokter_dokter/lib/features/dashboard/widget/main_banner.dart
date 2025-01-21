import 'package:flutter/material.dart';

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
        const SizedBox(height: 12.0),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            image,
            height: 125.0,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
