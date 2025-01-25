import 'dart:convert';

import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel channel;
  final String url;

  WebSocketService(this.url);

  Future<void> connect() async {
    channel = WebSocketChannel.connect(Uri.parse(url));
    channel.stream.listen((message) {
      print('Pesan baru $message');
    }, onError: (error) {
      print('Websocket error: $error');
    }, onDone: () {
      print('Koneksi websocket terputus');
    });
  }

  Future<void> sendMessage(String message) async {
    final session = await SessionHelper.getUserSession();
    final senderId = session["id"];
    if (senderId != null) {
      final formattedMessage = jsonEncode({
        'sender_id': senderId,
        'message': message,
      });
      channel.sink.add(formattedMessage);
    } else {
      print("Sender ID is null");
      // Handle missing sender ID
    }
  }

  void disconnect() {
    channel.sink.close();
  }
}
