import 'package:flutter/material.dart';

class EditProfileForm extends StatelessWidget {
  final String label;
  final String content;

  const EditProfileForm({
    required this.label,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 18.0),
      ],
    );
  }
}
