import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRepository {
  late WebSocketChannel _channel;
  static const String _wsUrl =
      'wss://tanya-dokter-api.fakhrurcodes.my.id/v1/chat/ws/senderId/receiverId';

  void connect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final uri = Uri.parse('$_wsUrl?token=$token');

      _channel = WebSocketChannel.connect(uri);
      _channel.stream.handleError((error) {
        print('WebSocket error: $error');
        reconnect();
      });
    } catch (e) {
      print('Error connecting to WebSocket: $e');
    }
  }

  void reconnect() {
    print('Attempting to reconnect...');
    connect();
  }

  void disconnect() {
    _channel.sink.close();
  }

  Stream<Message> get messages {
    return _channel.stream.map((message) {
      final decodedMessage = jsonDecode(message);
      return Message.fromJson(decodedMessage);
    });
  }

  void sendMessage(Message message) {
    try {
      final encodedMessage = jsonEncode(message.toJson());
      _channel.sink.add(encodedMessage);
      print('Message sent: $encodedMessage');
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
