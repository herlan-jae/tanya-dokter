import 'package:tanyadokter_dokter/features/chat/data/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatConnected extends ChatState {
  final List<Message> messages;

  ChatConnected({required this.messages});

  ChatConnected copyWith({List<Message>? newMessages}) {
    return ChatConnected(messages: newMessages ?? messages);
  }
}

class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});
}
