abstract class PaymentEvent {}

class SelectPaymentMethod extends PaymentEvent {
  final String methodId;
  final String methodName;

  SelectPaymentMethod(this.methodId, this.methodName);
}

class ConfirmPayment extends PaymentEvent {}
