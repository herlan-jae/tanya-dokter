// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tanyadokter_dokter/features/chat/data/message_model.dart';

abstract class ChatEvent {}

class ConnectToChat extends ChatEvent {
  final String userId;
  final bool isDoctor;
  final String receiverId;

  ConnectToChat({
    required this.userId,
    required this.isDoctor,
    required this.receiverId,
  });
}

class SendMessage extends ChatEvent {
  final String content;
  final String receiverId;

  SendMessage({required this.content, required this.receiverId});
}

class MessageReceived extends ChatEvent {
  final Message message;

  MessageReceived({required this.message});
}

class DisconnectFromChat extends ChatEvent {}
