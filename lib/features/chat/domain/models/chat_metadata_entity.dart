class ChatMetadataEntity {
  final String userId;
  final String driverId;
  final String lastMessage;
  final DateTime timestamp;

  const ChatMetadataEntity({
    required this.userId,
    required this.driverId,
    required this.lastMessage,
    required this.timestamp,
  });
}
