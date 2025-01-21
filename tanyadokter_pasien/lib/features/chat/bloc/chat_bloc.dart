import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/data/chat_repository.dart';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';

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
    print('Connecting to chat with userId: ${event.userId}');
    try {
      _currentUserId = event.userId;
      _isDoctor = event.isDoctor;
      _repository.connect();

      _chatSubscription = _repository.messages.listen(
        (message) {
          print('Message received: ${message.content}');
          add(MessageReceived(message: message));
        },
        onError: (error) {
          print('Error in message stream: $error');
          emit(ChatError(error: 'Error receiving message: $error'));
        },
      );

      emit(ChatConnected(messages: []));
    } catch (e) {
      print('Error connecting to chat: $e');
      emit(ChatError(error: e.toString()));
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
