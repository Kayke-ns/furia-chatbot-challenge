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
  late final ChatController _chatController;
  late final AnimationController _typingAnimationController;

  @override
  void initState() {
    super.initState();
    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _chatController = ChatController()
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
    _chatController.dispose();
    _typingAnimationController.dispose();
    super.dispose();
  }

  Widget _buildQuickButtons() {
    if (_chatController.expectingMvpVote) {
      return _buildMvpPollButtons();
    }
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
                    onPressed: () => _chatController.sendMessage(quickReplies[index]),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xFFFFD700)),
                      ),
                    ),
                    child: Text(quickReplies[index], style: TextStyle(color: Colors.white),),
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
    return _chatController.isTyping
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
        automaticallyImplyLeading: false,
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
                controller: _chatController.scrollController,
                itemCount: _chatController.messages.length + (_chatController.isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= _chatController.messages.length) {
                    return _buildTypingIndicator();
                  }
                  return ChatBubble(
                    msg: _chatController.messages[index],
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
                      controller: _chatController.textController,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onSubmitted: _chatController.sendMessage,
                      decoration: InputDecoration(
                        hintText: "Digite sua mensagem...",
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () => _chatController.sendMessage(_chatController.textController.text),
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

  Widget _buildMvpPollButtons() {
    return Column(
      children: [
        const Text('Vote no MVP:', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildPlayerButton('1', 'arT'),
            _buildPlayerButton('2', 'KSCERATO'),
            _buildPlayerButton('3', 'yuurih'),
            _buildPlayerButton('4', 'chelo'),
            _buildPlayerButton('5', 'drop'),
          ],
        ),
      ],
    );
  }

  Widget _buildPlayerButton(String number, String name) {
    return ElevatedButton(
      onPressed: () => _chatController.sendMessage(number),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      child: Text(number, style: const TextStyle(color: Colors.white)),
    );
  }
}
