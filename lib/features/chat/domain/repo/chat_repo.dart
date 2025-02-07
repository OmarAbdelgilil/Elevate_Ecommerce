import '../models/chat_metadata_entity.dart';
import '../models/message_model.dart';

abstract class ChatRepository {
  Stream<List<ChatMetadataEntity>> getChatsForUser(String userId);
  Future<void> sendMessage(MessageEntity message);
  Stream<List<MessageEntity>> getMessages(String chatId);
}
