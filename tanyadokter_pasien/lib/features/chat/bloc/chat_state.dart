abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatConnecting extends ChatState {}

class ChatConnected extends ChatState {}

class ChatMessageSent extends ChatState {}

class ChatMessageReceived extends ChatState {
  final String message;

  ChatMessageReceived(this.message);
}

class ChatError extends ChatState {
  final String error;

  ChatError(this.error);
}
