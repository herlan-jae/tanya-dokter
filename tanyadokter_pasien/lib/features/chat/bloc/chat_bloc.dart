import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/data/web_socket_service.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService _webSocketService;

  ChatBloc(this._webSocketService) : super(const ChatState()) {
    _webSocketService.stream.listen((message) {
      add(MessageReceived(message));
    });

    on<MessageSent>((event, emit) {
      _webSocketService.sendMessage(event.message);
    });

    on<MessageReceived>((event, emit) {
      final updatedMessages = List<String>.from(state.messages)
        ..add(event.message);
      emit(state.copyWith(messages: updatedMessages));
    });
  }

  @override
  Future<void> close() {
    _webSocketService.dispose();
    return super.close();
  }
}
