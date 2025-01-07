import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/email_verification_repository.dart';
import 'email_verification_event.dart';
import 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final EmailVerificationRepository emailVerificationRepository;

  EmailVerificationBloc(this.emailVerificationRepository)
      : super(EmailVerificationInitial()) {
    on<SendVerificationPIN>(
      (event, emit) async {
        emit(EmailVerificationLoading());
        try {
          await emailVerificationRepository.sendVerificationPIN(event.email);
          emit(EmailVerificationPINSent());
        } catch (e) {
          emit(EmailVerificationFailed(
            error: e.toString(),
          ));
        }
      },
    );

    on<VerifyPIN>(
      (event, emit) async {
        emit(EmailVerificationLoading());
        try {
          await emailVerificationRepository.verifyPIN(event.email, event.pin);
          emit(EmailVerificationSuccess());
        } catch (e) {
          emit(EmailVerificationFailed(
            error: e.toString(),
          ));
        }
      },
    );

    on<ResendPIN>((event, emit) async {
      emit(EmailVerificationLoading());
      try {
        await emailVerificationRepository.resendPIN(event.email);
        emit(ResendPINSuccess());
      } catch (e) {
        emit(EmailVerificationFailed(error: e.toString()));
      }
    });
  }
}
