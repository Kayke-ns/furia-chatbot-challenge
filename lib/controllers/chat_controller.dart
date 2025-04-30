import 'dart:async';
import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../data/bot_responses.dart';

class ChatController {
  final List<Message> messages = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  Timer? _automaticMessagesTimer;
  int _automaticMessageIndex = 0;
  bool _userSentFirstMessage = false;
  bool _isTyping = false;
  bool _initialized = false;
  bool _expectingMvpVote = false;

  VoidCallback? onNewMessage;
  VoidCallback? onTypingStateChanged;

  bool get isTyping => _isTyping;
  bool get expectingMvpVote => _expectingMvpVote;

  void initialize() {
    if (!_initialized) {
      _initialized = true;
      _sendWelcomeMessage();
    }
  }

  void _sendWelcomeMessage() {
    addMessage(Message(
      '🖤 Bem-vindo ao FURIA ChatBot! Envie sua primeira mensagem para começarmos!',
      true,
    ));
  }

  void addMessage(Message message) {
    messages.add(message);
    onNewMessage?.call();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _startAutomaticMessages() {
    _automaticMessagesTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      if (_automaticMessageIndex < automaticMessages.length && _userSentFirstMessage) {
        _setTyping(true);

        Future.delayed(const Duration(seconds: 1), () {
          addMessage(Message(
              automaticMessages[_automaticMessageIndex],
              true
          ));
          _automaticMessageIndex++;
          _setTyping(false);
        });
      }
    });
  }

  void _setTyping(bool typing) {
    _isTyping = typing;
    onTypingStateChanged?.call();
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    addMessage(Message(text, false));
    textController.clear();

    if (!_userSentFirstMessage) {
      _userSentFirstMessage = true;
      _startAutomaticMessages();
    }

    _setTyping(true);
    Future.delayed(const Duration(seconds: 1), () {
      _handleBotResponse(text);
      _setTyping(false);
    });
  }

  void _handleBotResponse(String userMessage) {
    String? response;

    if (_expectingMvpVote && ['1','2','3','4','5'].contains(userMessage.trim())) {
      response = mvpResponses[userMessage.trim()];
      _expectingMvpVote = false;
    }
    else {
      for (var key in botResponses.keys) {
        if (userMessage.toLowerCase().contains(key.toLowerCase())) {
          response = botResponses[key];
          if (key == "🎯 MVP do jogo") _expectingMvpVote = true;
          break;
        }
      }
      response ??= "🤔 Não entendi. Tente uma das opções abaixo!";
    }

    addMessage(Message(response!, true));
  }

  void dispose() {
    _automaticMessagesTimer?.cancel();
    scrollController.dispose();
    textController.dispose();
  }
}