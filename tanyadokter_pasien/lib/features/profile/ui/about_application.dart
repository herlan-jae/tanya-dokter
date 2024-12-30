import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/AboutScreen';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel arcu mi. Suspendisse vitae pulvinar orci, at gravida arcu. Donec sollicitudin accumsan magna. Proin pellentesque diam eu arcu luctus vestibulum. Mauris nulla nisi, dictum ac pharetra sit amet, sagittis ac ligula. Integer aliquet eros nibh, non bibendum ante aliquam vitae.',
                ),
                SizedBox(height: 18.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel arcu mi. Suspendisse vitae pulvinar orci, at gravida arcu. Donec sollicitudin accumsan magna. Proin pellentesque diam eu arcu luctus vestibulum. Mauris nulla nisi, dictum ac pharetra sit amet, sagittis ac ligula. Integer aliquet eros nibh, non bibendum ante aliquam vitae.',
                ),
                SizedBox(height: 18.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel arcu mi. Suspendisse vitae pulvinar orci, at gravida arcu. Donec sollicitudin accumsan magna. Proin pellentesque diam eu arcu luctus vestibulum. Mauris nulla nisi, dictum ac pharetra sit amet, sagittis ac ligula. Integer aliquet eros nibh, non bibendum ante aliquam vitae.',
                ),
                SizedBox(height: 18.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel arcu mi. Suspendisse vitae pulvinar orci, at gravida arcu. Donec sollicitudin accumsan magna. Proin pellentesque diam eu arcu luctus vestibulum. Mauris nulla nisi, dictum ac pharetra sit amet, sagittis ac ligula. Integer aliquet eros nibh, non bibendum ante aliquam vitae.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
