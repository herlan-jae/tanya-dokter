import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/data/web_socket_service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService webSocketService;

  ChatBloc(this.webSocketService) : super(ChatInitial()) {
    on<ConnectWebSocket>((event, emit) async {
      emit(ChatConnecting());
      try {
        await webSocketService.connect();
        emit(ChatConnected());
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });

    on<SendMessage>((event, emit) async {
      try {
        await webSocketService.sendMessage(event.message);
        emit(ChatMessageSent());
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });

    on<ReceiveMessage>((event, emit) {
      emit(ChatMessageReceived(event.message));
    });
  }
}
