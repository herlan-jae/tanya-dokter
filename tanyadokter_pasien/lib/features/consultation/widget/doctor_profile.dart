import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/consultation/ui/payment_screen.dart';

class ShowDoctorProfile extends StatelessWidget {
  const ShowDoctorProfile({super.key});

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
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                // Status Online
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              'dr. Waleed Abu Kareem, S.um',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Dokter Umum',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Memiliki 15 tahun pengalaman dalam melayani pasien dengan keluhan umum, memberikan vaksinasi, memberikan diagnosis, pengobatan, prosedur medis dasar, dan melakukan program kesehatan masyarakat',
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
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.0),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.chat, size: 12.0),
                    label: Text(
                      'Konsultasi',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Color(0xFF116487),
                      foregroundColor: Color(0xFFDDF2FF),
                      minimumSize: Size(142.0, 30.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(PaymentScreen.routeName);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
