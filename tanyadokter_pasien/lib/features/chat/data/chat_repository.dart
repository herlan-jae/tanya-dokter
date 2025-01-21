import 'dart:convert';
import 'package:tanyadokter_pasien/features/chat/data/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatRepository {
  late WebSocketChannel _channel;
  final String _wsUrl;
  final String _token;

  ChatRepository({required String wsUrl, required String token})
      : _wsUrl = wsUrl,
        _token = token;

  void connect() {
    final uri = Uri.parse('$_wsUrl?token=$_token');
    _channel = WebSocketChannel.connect(uri);
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
    final encodedMessage = jsonEncode(message.toJson());
    _channel.sink.add(encodedMessage);
  }
}
