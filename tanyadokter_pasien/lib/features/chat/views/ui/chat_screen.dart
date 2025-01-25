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
  final String image;

  const ChatScreen({
    super.key,
    required this.receiverId,
    required this.isDoctor,
    required this.name,
    required this.image,
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
        leadingWidth: 70.0,
        foregroundColor: Colors.white,
        toolbarHeight: 80.0,
        backgroundColor: const Color(0xFF116487),
        leading: InkWell(
          onTap: () {
            showDialog(
                context: context, builder: (context) => ExitChatDialog());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back_rounded),
                const SizedBox(width: 8.0),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    foregroundImage: AssetImage(widget.image),
                    backgroundImage: AssetImage(widget.image),
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text(widget.name),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitial) {
            return PageLoadingWidget();
          }
          if (state is ChatError) {
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
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMyMessage
                                ? Colors.blueAccent
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
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              // Text(
                              //   message.timestamp.toString(),
                              //   style: TextStyle(
                              //       fontSize: 8.0, color: Colors.white),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Ketik pesan...',
                            hintStyle: TextStyle(fontSize: 14.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
                          ),
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.send_rounded,
                          size: 30.0,
                        ),
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
