import 'package:flutter/material.dart';

import '../../../../domain/models/message_model.dart';
import '../../../../domain/use_cases/get_messages_use_case.dart';
import '../../../../domain/use_cases/send_message_use_case.dart';


class ChatViewModel extends ChangeNotifier {
  final GetMessagesUseCase _getMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  List<MessageEntity> _messages = [];
  bool _isLoading = false;
  Stream<List<MessageEntity>>? _messagesStream;

  List<MessageEntity> get messages => _messages;
  bool get isLoading => _isLoading;

  ChatViewModel({
    required GetMessagesUseCase getMessagesUseCase,
    required SendMessageUseCase sendMessageUseCase,
  })  : _getMessagesUseCase = getMessagesUseCase,
        _sendMessageUseCase = sendMessageUseCase;

  void loadMessages(String chatId) {
    _isLoading = true;
    notifyListeners();

    _messagesStream = _getMessagesUseCase.call(chatId);

    _messagesStream!.listen((newMessages) {
      _messages = newMessages;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> sendMessage(MessageEntity message) async {
    await _sendMessageUseCase.call(message);
  }
}