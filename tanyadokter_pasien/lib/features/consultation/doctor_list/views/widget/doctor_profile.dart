import 'package:flutter/material.dart';

class ShowDoctorProfile extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final String description;
  final int patient;
  final String price;
  final bool status;
  final Function paymentFunction;

  const ShowDoctorProfile({
    super.key,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.patient,
    required this.price,
    required this.status,
    required this.paymentFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 77,
                  height: 77,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF116487),
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
                // Status Online
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: status ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              category,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 11.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Color(0xFFDDF2FF),
                      foregroundColor: Color(0xFF116487),
                      minimumSize: Size(142.0, 30.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Color(0xFF116487),
                      foregroundColor: Color(0xFFDDF2FF),
                      minimumSize: Size(142.0, 30.0),
                    ),
                    onPressed: () => paymentFunction(),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Konsultasi',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
