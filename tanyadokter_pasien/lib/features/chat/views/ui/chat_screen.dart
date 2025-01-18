import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/chat/views/widget/chat_bubble.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;

  const ChatScreen({
    super.key,
    required this.senderId,
    required this.receiverId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late Future<WebSocketChannel> _channelFuture;

  @override
  void initState() {
    super.initState();
    _channelFuture = _connectWebSocket();
  }

  Future<WebSocketChannel> _connectWebSocket() async {
    final url =
        "wss://tanya-dokter-api.fakhrurcodes.my.id/v1/chat/ws/${widget.senderId}/${widget.receiverId}";
    return WebSocketChannel.connect(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: FutureBuilder<WebSocketChannel>(
        future: _channelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            final channel = snapshot.data!;
            return _buildChatScreen(channel);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildChatScreen(WebSocketChannel channel) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as String;
                final messageData = jsonDecode(data);
                final isSender = messageData['senderId'] == widget.senderId;

                return ListView(
                  children: [
                    ChatBubble(
                      message: messageData['message'],
                      isSender: isSender,
                    ),
                  ],
                );
              }
              return Container();
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
                    final messageJson = jsonEncode({
                      'senderId': widget.senderId,
                      'receiverId': widget.receiverId,
                      'message': message,
                    });
                    channel.sink.add(messageJson);
                    _messageController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _channelFuture.then((channel) => channel.sink.close());
    _messageController.dispose();
    super.dispose();
  }
}
