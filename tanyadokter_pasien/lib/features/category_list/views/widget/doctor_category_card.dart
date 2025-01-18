import 'package:flutter/material.dart';

class DoctorCategoryCard extends StatelessWidget {
  final String name;
  final String image;

  const DoctorCategoryCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28.0),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 370.0,
                height: 120.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.black.withValues(alpha: 0.7),
              ),
              width: 370.0,
              height: 120.0,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
