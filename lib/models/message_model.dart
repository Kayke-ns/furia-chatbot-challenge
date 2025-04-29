class Message {
  final String text;
  final bool isBot;
  final DateTime timestamp;

  Message(this.text, this.isBot, [DateTime? timestamp])
      : timestamp = timestamp ?? DateTime.now();
}