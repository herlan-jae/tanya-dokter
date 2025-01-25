import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/core/constant/assets_manager.dart';

class LogoutDialog extends StatelessWidget {
  final Function function;
  const LogoutDialog({
    super.key,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetsManager.failIcon,
              height: 60.0,
            ),
            SizedBox(height: 24.0),
            Text(
              'Keluar dari aplikasi?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kamu bisa login lagi nanti',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(220.0, 30.0),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Batal'),
                  ),
                ),
                SizedBox(width: 4.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      function();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(220.0, 30.0),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Keluar'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
