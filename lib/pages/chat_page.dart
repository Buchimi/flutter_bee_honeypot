import 'package:flutter/material.dart';
import 'package:flutter_bee_honeypot/widgets/chat_bubble_widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SentMessageBubble(message: "Hello"),
        RecievedMessageBubble(message: "Hi, how are you"),
        SentMessageBubble(message: "I am great how are you doing"),
        RecievedMessageBubble(message: "I am also fine"),
        SentMessageBubble(message: "Can we meet tomorrow?"),
        RecievedMessageBubble(message: "Yes, of course we will meet tomorrow"),
      ],
    );
  }
}
