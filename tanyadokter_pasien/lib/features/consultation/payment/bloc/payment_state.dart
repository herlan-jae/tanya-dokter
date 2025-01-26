abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String methodId;
  final List<String> paymentOptions;
  final String selectedOption;

  PaymentMethodSelected(this.methodId, this.paymentOptions,
      [this.selectedOption = '', berikan]);
}

class PaymentConfirming extends PaymentState {}

class PaymentConfirmed extends PaymentState {}

class PaymentFailed extends PaymentState {}
