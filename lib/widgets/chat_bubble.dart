import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final Message msg;

  const ChatBubble({
    super.key,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: msg.isBot ? Alignment.centerLeft : Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Column(
          crossAxisAlignment: msg.isBot ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: msg.isBot ? const Color(0xFF1E1E1E) : const Color(0xFFFFD700),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(msg.isBot ? 0 : 16),
                  bottomRight: Radius.circular(msg.isBot ? 16 : 0),
                ),
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  fontSize: 16,
                  color: msg.isBot ? Colors.white : Colors.black,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}