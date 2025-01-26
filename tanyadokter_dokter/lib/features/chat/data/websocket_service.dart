import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;
  final String url;

  WebSocketService(this.url);

  Future<void> connect() async {
    channel = WebSocketChannel.connect(Uri.parse(url));
    channel.stream.listen(
      (message) {
        print('New message: $message');
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );
  }

  Future<void> sendMessage(String message, String senderId) async {
    final formattedMessage = jsonEncode({
      'sender_id': senderId,
      'message': message,
    });
    channel.sink.add(formattedMessage);
  }

  void disconnect() {
    channel.sink.close();
  }
}
