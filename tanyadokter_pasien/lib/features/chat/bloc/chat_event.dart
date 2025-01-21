// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';

abstract class ChatEvent {}

class ConnectToChat extends ChatEvent {
  final String userId;
  final bool isDoctor;

  ConnectToChat({required this.userId, required this.isDoctor});
}

class SendMessage extends ChatEvent {
  final Message message;
  final String receiverId;

  SendMessage({required this.message, required this.receiverId});
}

class MessageReceived extends ChatEvent {
  final Message message;

  MessageReceived({required this.message});
}

class DisconnectFromChat extends ChatEvent {}
