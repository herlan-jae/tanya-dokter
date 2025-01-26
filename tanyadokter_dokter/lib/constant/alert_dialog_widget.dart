// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tanyadokter_dokter/constant/assets_manager.dart';

class AlertDialogSuccess extends StatelessWidget {
  final String label;
  final Function function;

  const AlertDialogSuccess({
    super.key,
    required this.label,
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
              AssetsManager.successIcon,
              height: 60.0,
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Berhasil',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                function();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220.0, 30.0),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogFailed extends StatelessWidget {
  final String label;
  final Function function;

  const AlertDialogFailed({
    super.key,
    required this.label,
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
            const SizedBox(height: 12.0),
            const Text(
              'Gagal',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                function();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220.0, 30.0),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
