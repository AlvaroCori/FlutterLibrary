import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider_file.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/new_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/5/51/%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_%D0%9F%D1%83%D1%82%D0%B8%D0%BD_%2818-06-2023%29_%28cropped%29.jpg")

          ),
        ),
      title: const Text("Hello"),
      centerTitle: true,
     ),
     body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.message.length,
            itemBuilder:(context, index) {
            final message = chatProvider.message[index];
            return message.fromWho == FromWho.mine? MyMessageBubble(message: message): HerMessageBubble(message: message);
          },)),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          )
        ],
      ),
    )
    );

  }
}