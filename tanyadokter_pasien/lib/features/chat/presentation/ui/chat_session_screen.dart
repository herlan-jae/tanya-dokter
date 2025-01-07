import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';
import 'package:tanyadokter_pasien/features/chat/presentation/widget/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final String currentUserId = 'current_user_id';

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final messageJson = state.messages[index];
                    final message = Message.fromJson(jsonDecode(messageJson));

                    final isSender = message.senderId == currentUserId;

                    return ChatBubble(
                      message: message.message,
                      isSender: isSender,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = _messageController.text;
                    if (message.isNotEmpty) {
                      context.read<ChatBloc>().add(MessageSent(message));
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
