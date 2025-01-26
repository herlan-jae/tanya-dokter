import 'package:flutter/material.dart';
import 'package:tanyadokter_dokter/constant/assets_manager.dart';

class ExitChatDialog extends StatelessWidget {
  const ExitChatDialog({
    super.key,
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
            const SizedBox(height: 24.0),
            const Text(
              'Hentikan Chat?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Chat akan langsung berakhir',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(220.0, 30.0),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/root');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(220.0, 30.0),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Akhiri'),
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
