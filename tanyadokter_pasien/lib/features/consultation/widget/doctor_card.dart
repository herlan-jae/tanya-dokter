import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/consultation/widget/doctor_profile.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120.0,
          width: 370.0,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Color(0xFFDDF2FF),
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF116487),
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  // Status Online
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dr. Waleed Abu Kareem, S.um',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Dokter umum',
                      style: TextStyle(fontSize: 10.0),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.person, size: 12.0),
                        SizedBox(width: 4.0),
                        Text(
                          '124 Pasien',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.star, size: 12.0),
                        SizedBox(width: 4.0),
                        Text(
                          '4.8',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp. 50.000',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 4,
          right: 24,
          child: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => ShowDoctorProfile());
            },
            icon: Icon(Icons.chat, size: 12.0),
            label: Text('Chat', style: TextStyle(fontSize: 10.0)),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Color(0xFF116487),
              foregroundColor: Color(0xFFDDF2FF),
              minimumSize: Size(100.0, 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
