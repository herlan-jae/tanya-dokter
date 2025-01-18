import 'package:flutter/material.dart';

class PaymentListWidget extends StatelessWidget {
  final String label;
  final Function function;

  const PaymentListWidget({
    super.key,
    required this.label,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20.0),
      ),
    );
  }
}
