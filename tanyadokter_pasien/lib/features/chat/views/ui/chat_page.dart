import 'package:flutter/material.dart';
import 'package:tanyadokter_pasien/features/chat/views/ui/chat_screen.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';

  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null ||
        !args.containsKey('senderId') ||
        !args.containsKey('receiverId')) {
      return Scaffold(
        body: Center(
          child: Text('Invalid chat data. Please try again.'),
        ),
      );
    }

    final String senderId = args['senderId'];
    final String receiverId = args['receiverId'];

    return Scaffold(
      body: ChatScreen(senderId: senderId, receiverId: receiverId),
    );
  }
}
