import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/data/chat_repository.dart';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _repository;
  StreamSubscription? _chatSubscription;
  String? _currentUserId;
  bool? _isDoctor;

  ChatBloc({required ChatRepository repository})
      : _repository = repository,
        super(ChatInitial()) {
    on<ConnectToChat>(_onConnectToChat);
    on<SendMessage>(_onSendMessage);
    on<MessageReceived>(_onMessageReceived);
    on<DisconnectFromChat>(_onDisconnectFromChat);
  }

  void _onConnectToChat(ConnectToChat event, Emitter<ChatState> emit) {
    try {
      _currentUserId = event.userId;
      _isDoctor = event.isDoctor;
      _repository.connect();

      _chatSubscription = _repository.messages.listen(
        (message) => add(MessageReceived(message: message)),
        onError: (error) => emit(ChatError(error: error.toString())),
      );

      emit(ChatConnected(messages: []));
    } catch (e) {
      emit(ChatError(error: e.toString()));
    }
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    if (state is ChatConnected) {
      final message = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: _currentUserId!,
        receiverId: event.receiverId,
        message: event.message,
        timestamp: DateTime.now(),
        isDoctor: _isDoctor!,
      );

      _repository.sendMessage(message);

      final currentMessage = (state as ChatConnected).messages;
      emit(ChatConnected(messages: [...currentMessage, message]));
    }
  }

  void _onMessageReceived(MessageReceived event, Emitter<ChatState> emit) {
    if (state is ChatConnected) {
      final currentMessage = (state as ChatConnected).messages;
      emit(ChatConnected(messages: [...currentMessage, event.message]));
    }
  }

  void _onDisconnectFromChat(
      DisconnectFromChat event, Emitter<ChatState> emit) {
    _chatSubscription?.cancel();
    _repository.disconnect();
    emit(ChatInitial());
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    _repository.disconnect();
    return super.close();
  }
}
