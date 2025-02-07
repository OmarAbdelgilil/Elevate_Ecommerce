import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/chat_metadata_entity.dart';
import '../../domain/models/message_model.dart';
import '../../domain/repo/chat_repo.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore firestore;

  ChatRepositoryImpl({required this.firestore});

  @override
  Stream<List<ChatMetadataEntity>> getChatsForUser(String userId) {
    return firestore.collection('chats')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMetadataEntity(
          userId: doc['userId'],
          driverId: doc['driverId'],
          lastMessage: doc['lastMessage'],
          timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp']),
        );
      }).toList();
    });
  }
  String generateChatId(String userId, String driverId) {
    List<String> ids = [userId, driverId];
    ids.sort();
    return ids.join("_");
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    String chatId = generateChatId(message.senderId, message.receiverId);

    await firestore.collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': message.senderId,
      'receiverId': message.receiverId,
      'text': message.text,
      'timestamp': message.timestamp.millisecondsSinceEpoch,
    });
  }

  @override
  Stream<List<MessageEntity>> getMessages(String chatId) {
    return firestore.collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      return MessageEntity(
        senderId: doc['senderId'],
        receiverId: doc['receiverId'],
        text: doc['text'],
        timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp']),
      );
    }).toList());
  }
}
