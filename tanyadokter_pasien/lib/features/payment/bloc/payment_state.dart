abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String methodId;
  final String methodName;
  final List<String> paymentOptions;

  PaymentMethodSelected(this.methodId, this.paymentOptions, this.methodName);
}

class PaymentConfirming extends PaymentState {}

class PaymentConfirmed extends PaymentState {}

class PaymentFailed extends PaymentState {}
