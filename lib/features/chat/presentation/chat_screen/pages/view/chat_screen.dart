import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/features/data_intent/data_intent.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../../../../domain/models/message_model.dart';
import '../view_model/chat_view_model.dart';

class ChatPage extends StatelessWidget {
  final String chatId;
  final String senderId;
  final String receiverId;

  const ChatPage({
    super.key,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<ChatViewModel>()..loadMessages(chatId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pinkAccent,
          leadingWidth: 40,
          title: Row(
            children: [
              SvgPicture.asset(SVGAssets.boy, height: 30),
              const SizedBox(width: 10),
              Text(
                DataIntent.getDriverName(),
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(child: _buildMessageList(viewModel)),
                _buildMessageInput(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessageList(ChatViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.pinkAccent));
    }
    if (viewModel.messages.isEmpty) {
      return const Center(child: Text("No messages yet.", style: TextStyle(color: Colors.pinkAccent)));
    }
    return ListView.builder(
      reverse: true,
      itemCount: viewModel.messages.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        final message = viewModel.messages[index];
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(MessageEntity message) {
    bool isSentByMe = message.senderId == senderId;
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.pinkAccent.withOpacity(0.9) : Colors.pink[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              _formatTimestamp(message.timestamp),
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('hh:mm a').format(timestamp);
  }

  Widget _buildMessageInput(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.pink[50],
                hintText: "Send a chat...",
                hintStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.pinkAccent),
            onPressed: () {
              String text = messageController.text.trim();
              if (text.isNotEmpty) {
                final message = MessageEntity(
                  senderId: senderId,
                  receiverId: receiverId,
                  text: text,
                  timestamp: DateTime.now(),
                );
                context.read<ChatViewModel>().sendMessage(message);
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
