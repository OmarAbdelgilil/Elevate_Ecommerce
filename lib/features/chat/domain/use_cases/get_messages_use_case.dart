import 'package:injectable/injectable.dart';

import '../models/message_model.dart';
import '../repo/chat_repo.dart';
@injectable
class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase({required this.repository});

  Stream<List<MessageEntity>> call(String chatId) {
    return repository.getMessages(chatId);
  }
}
