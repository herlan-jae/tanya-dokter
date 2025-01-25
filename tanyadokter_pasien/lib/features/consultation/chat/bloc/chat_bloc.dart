import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/consultation/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/consultation/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/consultation/chat/data/chat_repository.dart';
import 'package:tanyadokter_pasien/features/consultation/chat/data/message_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _repository;
  StreamSubscription<Message>? _chatSubscription;
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

  void _onConnectToChat(
    ConnectToChat event,
    Emitter<ChatState> emit,
  ) async {
    try {
      _currentUserId = event.userId;
      _isDoctor = event.isDoctor;

      await _repository.connect(); // Await the connection

      _chatSubscription = _repository.messages.listen(
        (message) => add(MessageReceived(message: message)),
        onError: (error) => emit(ChatError(error: error.toString())),
      );

      emit(ChatConnected(messages: []));
    } catch (e) {
      emit(ChatError(error: 'Connection failed: ${e.toString()}'));
    }
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    if (state is ChatConnected) {
      final message = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: _currentUserId!,
        receiverId: event.receiverId,
        content: event.content,
        timestamp: DateTime.now(),
        isDoctor: _isDoctor!,
      );

      try {
        _repository.sendMessage(message);
        final currentMessage = (state as ChatConnected).messages;
        emit(ChatConnected(messages: [...currentMessage, message]));
      } catch (e) {
        emit(ChatError(error: 'Failed to send message: $e'));
        print('Error: $e');
      }
    }
  }

  void _onMessageReceived(MessageReceived event, Emitter<ChatState> emit) {
    if (state is ChatConnected) {
      final currentMessages = (state as ChatConnected).messages;
      emit(ChatConnected(messages: [...currentMessages, event.message]));
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
