// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/core/widget/loading_widget.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/views/widget/exit_chat_dialog_widget.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  final String receiverId;
  final bool isDoctor;
  final String name;

  const ChatScreen({
    super.key,
    required this.receiverId,
    required this.isDoctor,
    required this.name,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? _userId;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    final session = await SessionHelper.getUserSession();
    setState(() {
      _userId = session['user_id'].toString();
    });

    if (_userId != null) {
      context.read<ChatBloc>().add(
            ConnectToChat(
              userId: _userId!,
              receiverId: widget.receiverId,
              isDoctor: widget.isDoctor,
            ),
          );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    context.read<ChatBloc>().add(DisconnectFromChat());
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      context.read<ChatBloc>().add(
            SendMessage(
                content: _messageController.text.trim(),
                receiverId: widget.receiverId),
          );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ExitChatDialog();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(widget.name),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitial) {
            return PageLoadingWidget();
          }

          if (state is ChatError) {
            print('Error: ${state.error}');
            return Center(child: Text('Error: ${state.error}'));
          }

          if (state is ChatConnected) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isMyMessage = message.senderId == _userId;

                      return Align(
                        alignment: isMyMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMyMessage
                                ? Colors.blue[100]
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: isMyMessage
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.content,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                message.timestamp.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
