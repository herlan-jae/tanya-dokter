abstract class PaymentEvent {}

class SelectPaymentMethod extends PaymentEvent {
  final String methodId;
  final String selectedOption;

  SelectPaymentMethod(this.methodId, this.selectedOption);
}

class ConfirmPayment extends PaymentEvent {}
