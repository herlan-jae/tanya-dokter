import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/register_repository.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;

  RegisterBloc(this.registerRepository) : super(RegisterInitial()) {
    on<RegisterSubmitted>(
      (event, emit) async {
        emit(RegisterLoading());
        try {
          final userData = await registerRepository.register(
            event.fullname,
            event.gender,
            event.email,
            event.password,
          );
          emit(RegisterSucces(userData));
        } catch (e) {
          emit(RegisterFailed(error: e.toString()));
        }
      },
    );
  }
}
