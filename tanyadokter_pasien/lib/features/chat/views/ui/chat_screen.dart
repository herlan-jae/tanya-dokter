import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_bloc.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_event.dart';
import 'package:tanyadokter_pasien/features/chat/bloc/chat_state.dart';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';
import 'package:tanyadokter_pasien/features/chat/views/widget/chat_bubble.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  final String receiverId;

  const ChatPage({super.key, required this.receiverId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  late WebSocketChannel _channel;
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _initializeWebSocket();
  }

  void _initializeWebSocket() async {
    final session = await SessionHelper.getUserSession();
    final userId = session['user_id'];

    if (userId != null) {
      _channel = await connectWebSocket(widget.receiverId);
    } else {
      print('User ID tidak ditemukan');
      // Tampilkan pesan error atau navigasikan ke halaman login jika perlu
    }
  }

  Future<WebSocketChannel> connectWebSocket(String receiverId) async {
    final session = await SessionHelper.getUserSession();
    final userId = session["user_id"];

    if (userId == null) {
      print('User ID tidak ditemukan');
      throw Exception("User ID tidak ditemukan");
    }

    final url =
        'wss://tanya-dokter-api.fakhrurcodes.my.id/v1/chat/ws/$userId/$receiverId';
    return WebSocketChannel.connect(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        foregroundColor: Colors.white,
        toolbarHeight: 80.0,
        backgroundColor: const Color(0xFF116487),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              const SizedBox(width: 4.0),
              const Icon(Icons.arrow_back_rounded),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(),
                  ),
                ],
              ),
            ],
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'dr. Waleed Abu Kareem, S.um',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dokter Umum',
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: SessionHelper.getUserSession(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('User ID not found'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          final isSender =
                              message.senderId == snapshot.data?["user_id"];

                          return ChatBubble(
                            message: message.message,
                            isSender: isSender,
                          );
                        },
                      );
                    },
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: const TextStyle(fontSize: 11.0),
                            decoration: InputDecoration(
                              hintText: 'Ketik pesan...',
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
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        IconButton(
                          onPressed: () async {
                            final message = _messageController.text;
                            if (message.isNotEmpty) {
                              final session =
                                  await SessionHelper.getUserSession();
                              final userId = session["user_id"];

                              if (userId == null) {
                                // Tampilkan pesan error atau notifikasi kepada pengguna
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'User ID tidak ditemukan. Silakan coba lagi.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                return; // Keluarkan dari fungsi jika userId tidak ditemukan
                              }

                              final receiverId = widget.receiverId;
                              final timestamp =
                                  DateTime.now().toIso8601String();

                              context
                                  .read<ChatBloc>()
                                  .add(SendMessage(message));

                              _messages.add(Message(
                                senderId: userId,
                                receiverId: receiverId,
                                message: message,
                                status: 1,
                                timestamp: timestamp,
                              ));

                              _messageController.clear();
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Color(0xFF086E96),
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
