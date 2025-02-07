part of 'chat_bloc.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageEntity> messages;

  ChatLoaded({required this.messages});
}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
