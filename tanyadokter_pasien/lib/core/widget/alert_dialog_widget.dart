import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/core/assets/assets_manager.dart';

class AlertDialogSuccess extends StatelessWidget {
  final String label;

  const AlertDialogSuccess({
    super.key,
    required this.label,
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
              AssetsManager.successIcon,
              height: 60.0,
            ),
            SizedBox(height: 12.0),
            Text(
              'Berhasil',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220.0, 30.0),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogFailed extends StatelessWidget {
  final String label;

  const AlertDialogFailed({
    super.key,
    required this.label,
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
            SizedBox(height: 12.0),
            Text(
              'Gagal',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(220.0, 30.0),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
