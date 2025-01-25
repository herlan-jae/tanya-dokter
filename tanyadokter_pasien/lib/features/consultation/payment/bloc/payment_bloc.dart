import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/consultation/payment/bloc/payment_event.dart';
import 'package:tanyadokter_pasien/features/consultation/payment/bloc/payment_state.dart';
import 'package:tanyadokter_pasien/features/consultation/payment/data/payment_model.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<SelectPaymentMethod>((event, emit) {
      final method =
          paymentMethod.firstWhere((method) => method.id == event.methodId);
      print('Selected method: ${event.methodName}');
      emit(PaymentMethodSelected(
          event.methodId, method.paymentOptions, event.methodName));
    });

    on<ConfirmPayment>(
      (event, emit) async {
        emit(PaymentConfirming());
        await Future.delayed(Duration(seconds: 2));
        final success = DateTime.now().second % 2 == 0;
        if (success) {
          emit(PaymentConfirmed());
        } else {
          emit(PaymentFailed());
        }
      },
    );
  }
}
