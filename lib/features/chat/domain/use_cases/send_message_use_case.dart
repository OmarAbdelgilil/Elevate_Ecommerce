import 'package:injectable/injectable.dart';

import '../models/message_model.dart';
import '../repo/chat_repo.dart';
@injectable
class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase({required this.repository});

  Future<void> call(MessageEntity message) async {
    return repository.sendMessage(message);
  }
}
