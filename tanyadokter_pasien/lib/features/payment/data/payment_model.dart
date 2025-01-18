class PaymentModel {
  final String id;
  final String paymentName;
  final List<String> paymentOptions;

  PaymentModel({
    required this.id,
    required this.paymentName,
    required this.paymentOptions,
  });
}

final List<PaymentModel> paymentMethod = [
  PaymentModel(
    id: 'transfer_bank',
    paymentName: 'Transfer Bank',
    paymentOptions: [
      'Bank BCA',
      'Bank BRI',
      'Bank BNI',
      'Bank Mandiri',
    ],
  ),
  PaymentModel(
    id: 'virtual_account',
    paymentName: 'Virtual Account',
    paymentOptions: [
      'BCA VA',
      'BRI VA',
      'BNI VA',
      'Mandiri VA',
    ],
  ),
];
