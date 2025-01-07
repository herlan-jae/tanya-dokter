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