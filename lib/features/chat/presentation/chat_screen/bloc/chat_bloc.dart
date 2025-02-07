import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/message_model.dart';
import '../../../domain/use_cases/get_messages_use_case.dart';
import '../../../domain/use_cases/send_message_use_case.dart';


part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;

  ChatBloc({
    required this.sendMessageUseCase,
    required this.getMessagesUseCase,
  }) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<LoadMessagesEvent>(_onLoadMessages);
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    await sendMessageUseCase(event.message);
  }

  void _onLoadMessages(LoadMessagesEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    await for (var messages in getMessagesUseCase(event.chatId)) {
      emit(ChatLoaded(messages: messages));
    }
  }
}
