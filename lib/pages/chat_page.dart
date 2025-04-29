import 'package:flutter/material.dart';
import '../controllers/chat_controller.dart';
import '../data/bot_responses.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  late final ChatController _controller;
  late final AnimationController _typingAnimationController;

  @override
  void initState() {
    super.initState();
    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _controller = ChatController()
      ..onNewMessage = _refreshUI
      ..onTypingStateChanged = _refreshUI
      ..initialize();
  }

  void _refreshUI() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _typingAnimationController.dispose();
    super.dispose();
  }

  Widget _buildQuickButtons() {
    final quickReplies = botResponses.keys.toList();

    return SizedBox(
      height: 120,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 4),
            child: Text('Respostas rápidas:', style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: quickReplies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _controller.sendMessage(quickReplies[index]),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xFFFFD700)),
                      ),
                    ),
                    child: Text(quickReplies[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return _controller.isTyping
        ? Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                AnimatedIcon(
                  icon: AnimatedIcons.ellipsis_search,
                  progress: _typingAnimationController,
                  color: const Color(0xFFFFD700),
                ),
                const SizedBox(width: 4),
                const Text('Digitando...', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/furia_logo.png', height: 28),
            const SizedBox(width: 8),
            const Text('FURIA ChatBot'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controller.scrollController,
                itemCount: _controller.messages.length + (_controller.isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= _controller.messages.length) {
                    return _buildTypingIndicator();
                  }
                  return ChatBubble(
                    msg: _controller.messages[index],
                    animation: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 300),
                    )..forward(),
                  );
                },
              ),
            ),
            _buildQuickButtons(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller.textController,
                      onSubmitted: _controller.sendMessage,
                      decoration: InputDecoration(
                        hintText: "Digite sua mensagem...",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () => _controller.sendMessage(_controller.textController.text),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
