import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class MessageSent extends ChatEvent {
  final String message;

  const MessageSent(this.message);

  @override
  List<Object> get props => [message];
}

class MessageReceived extends ChatEvent {
  final String message;

  const MessageReceived(this.message);

  @override
  List<Object> get props => [message];
}
