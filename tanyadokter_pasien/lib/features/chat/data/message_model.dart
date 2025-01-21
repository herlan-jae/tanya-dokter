class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final int status;
  final String timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.status,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'],
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }
}
