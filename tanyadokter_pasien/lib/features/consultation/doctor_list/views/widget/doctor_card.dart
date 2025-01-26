import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final int patient;
  final String price;
  final String rating;
  final bool status;
  final Function function;

  const DoctorCard({
    super.key,
    required this.name,
    required this.category,
    required this.image,
    required this.patient,
    required this.price,
    required this.rating,
    required this.status,
    required this.function,
  });

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
            borderRadius: BorderRadius.circular(14.0),
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
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                  // Status Online
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: status ? Colors.green : Colors.red,
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
                      name,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      category,
                      style: TextStyle(fontSize: 10.0),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.person, size: 12.0),
                        SizedBox(width: 4.0),
                        Text(
                          '$patient Pasien',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.star, size: 12.0),
                        SizedBox(width: 4.0),
                        Text(
                          rating,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      price,
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
            onPressed: () => function(),
            icon: Icon(Icons.chat, size: 12.0, color: Colors.white),
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
