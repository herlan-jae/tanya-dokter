import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final String title;
  final Function onTap;

  const ProfileListTile({
    super.key,
    required this.label,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.2),
        const SizedBox(height: 8.0),
      ],
    );
  }
}