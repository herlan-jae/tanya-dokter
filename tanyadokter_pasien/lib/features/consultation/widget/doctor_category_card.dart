import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/doctor_list.dart';

class DoctorCategoryCard extends StatelessWidget {
  final String label;

  const DoctorCategoryCard({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(DoctorList.routeName);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: Image.asset(
                  'assets/images/category_bg.png',
                  fit: BoxFit.cover,
                  width: 370.0,
                  height: 120.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  color: Colors.blue.withOpacity(0.7),
                ),
                width: 370.0,
                height: 120.0,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                width: 200,
                height: 30.0,
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
