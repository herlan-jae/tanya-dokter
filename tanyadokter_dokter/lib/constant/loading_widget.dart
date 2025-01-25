import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageLoadingWidget extends StatelessWidget {
  const PageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.15,
        width: size.width * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitWave(
              size: 24.0,
              color: Colors.blue,
            ),
            SizedBox(height: size.height * 0.03),
            const Text('Memuat...')
          ],
        ),
      ),
    );
  }
}
