import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String paymentName;
  final List<String> options;
  final Function(String) onSelect;

  const PaymentMethodWidget({
    super.key,
    required this.paymentName,
    required this.options,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(paymentName),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          return ListTile(
            title: Text(option),
            onTap: () {
              onSelect(option);
              Navigator.of(context).pop();
            },
          );
        }).toList(),
      ),
    );
  }
}
