final Map<String, String> botResponses = {
  "📅 Próximo jogo": "🗓️ O próximo jogo da FURIA é amanhã, às 18h, contra a Liquid!\n\n🔗 Confira mais detalhes: https://www.furia.gg/agenda",
  "🔥 Jogada top": "💥 Que bala do KSCERATO no clutch 1v3 contra a NAVI!\n\n🎥 Assista o highlight: https://youtu.be/exemplo",
  "🎯 MVP do jogo": _buildMvpPoll(),
  "📊 Placar atual": "🧩 FURIA 13 x 10 NAVI – Estamos quase lá!\n\n⚡ Próximo mapa: Inferno",
  "👋 Oi": "🖤 Olá, furioso! Como posso te ajudar hoje?",
  "🛒 Loja": "🎁 Confira nossos produtos oficiais: https://www.furiastore.com.br\n\nUse o código FURIA10 para 10% de desconto!",
  "📺 Ao vivo": "🔴 A transmissão ao vivo está rolando na Twitch: https://twitch.tv/furiagg\n\n📡 15.000 espectadores assistindo agora!",
};

String _buildMvpPoll() {
  return '''🏆 Votação para MVP:
  
Escolha um jogador:
1. arT
2. KSCERATO
3. yuurih
4. chelo
5. drop

Responda com o número do jogador!''';
}

final Map<String, String> mvpResponses = {
  '1': '🔫 Ótima escolha! arT é sempre um ótimo candidato com suas jogadas agressivas!',
  '2': '🎯 KSCERATO? Excelente! Ele é o pilar da consistência da FURIA!',
  '3': '💥 yuurih selecionado! O monster clutch nunca falha!',
  '4': '🛡️ chelo é uma ótima escolha! A defesa dele é impecável!',
  '5': '⚡ drop foi sua escolha! O suporte que faz a diferença!',
};

final List<String> automaticMessages = [
  "📢 FURIA acabou de ganhar mais um round! 14 x 10",
  "🗳️ Quem você acha que será o MVP do jogo? Votação rápida:\n1️⃣ arT\n2️⃣ KSCERATO\n3️⃣ yuurih",
  "🧠 Você acha que o arT leva esse clutch 1v2? Responda com 👍 ou 👎",
  "⚡ ÚLTIMA HORA: FURIA se classifica para o playoffs do campeonato!",
  "🎤 Entrevista exclusiva com o KSCERATO disponível no nosso YouTube!",
];