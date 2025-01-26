import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanyadokter_dokter/features/chat/data/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRepository {
  WebSocketChannel? _channel;
  final StreamController<Message> _messageController =
      StreamController<Message>.broadcast();
  static const String _wsUrl =
      'wss://tanya-dokter-api.fakhrurcodes.my.id/v1/chat/ws/senderId/receiverId';

  Future<void> connect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '16';
      final uri = Uri.parse('$_wsUrl?token=$token');

      _channel = WebSocketChannel.connect(uri);

      _channel!.stream.listen((message) {
        try {
          final decodedMessage = jsonDecode(message);
          final parsedMessage = Message.fromJson(decodedMessage);
          _messageController.add(parsedMessage);
        } catch (e) {
          print('Error parsing message: $e');
        }
      }, onError: (error) {
        print('WebSocket error: $error');
        _messageController.addError(error);
        reconnect();
      }, onDone: () {
        print('WebSocket connection closed');
        reconnect();
      });
    } catch (e) {
      print('Error connecting to WebSocket: $e');
      _messageController.addError(e);
    }
  }

  void reconnect() {
    print('Attempting to reconnect...');
    connect();
  }

  void disconnect() {
    _channel?.sink.close();
    _messageController.close();
  }

  Stream<Message> get messages => _messageController.stream;

  void sendMessage(Message message) {
    if (_channel == null) {
      print('WebSocket not connected');
      return;
    }
    try {
      final encodedMessage = jsonEncode(message.toJson());
      _channel!.sink.add(encodedMessage);
      print('Message sent: $encodedMessage');
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
