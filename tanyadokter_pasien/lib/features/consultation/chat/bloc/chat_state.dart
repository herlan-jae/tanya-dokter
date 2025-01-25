// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tanyadokter_pasien/features/consultation/chat/data/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatConnected extends ChatState {
  final List<Message> messages;

  ChatConnected({required this.messages});
}

class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});
}
