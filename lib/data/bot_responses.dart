final Map<String, String> botResponses = {
  "📅 Próximo jogo": "🗓️ O próximo jogo da FURIA é amanhã, às 18h, contra a Liquid!\n\n🔗 Confira mais detalhes: https://www.furia.gg/agenda",
  "🔥 Jogada top": "💥 Que bala do KSCERATO no clutch 1v3 contra a NAVI!",
  "🎯 MVP do jogo": _buildMvpPoll(),
  "📊 Placar atual": "🧩 FURIA 13 x 10 NAVI – Estamos quase lá!\n\n⚡ Próximo mapa: Inferno",
  "👋 Oi": "🖤 Olá, furioso! Como posso te ajudar hoje?",
  "🛒 Loja": "🎁 Confira nossos produtos oficiais: https://www.furia.gg/",
  "📺 Ao vivo": "🔴 A transmissão ao vivo está rolando na Twitch: https://twitch.tv/furiagg\n\n📡 15.000 espectadores assistindo agora!",
};

String _buildMvpPoll() {
  return '''🏆 Votação para MVP: Mirage
  
Escolha um jogador:
1. arT
2. KSCERATO
3. yuurih
4. chelo
5. FalleN

Responda com o número do jogador!''';
}

final Map<String, String> mvpResponses = {
  '1': '💥 arT? O MAIOR AGRESSIVO DO CS2! Manda a braba e vira o jogo!',
  '2': '🎯 KSCERATO? O cabeça de série não erra um tiro!',
  '3': '👻 yuurih? O monstro dos clutches tá invocado!',
  '4': '🛡️ chelo? O MELHOR SUPORTE DO BR! Tá carregando o time nas costas!',
  '5': '🔫 FalleN? A lenda tá com a AWP zerada hoje!'
};

final List<String> automaticMessages = [
  "📢 FURIA acabou de ganhar mais um round! 14 x 10",
  "🗳️ Quem você acha que será o MVP do jogo? Votação rápida:\n1️⃣ FalleN\n2️⃣ KSCERATO\n3️⃣ yuurih",
  "🧠 Você acha que o FalleN leva esse clutch 1v2? Responda com 👍 ou 👎",
  "⚡ ÚLTIMA HORA: FURIA se classifica para o playoffs do campeonato!",
  "🎤 Entrevista exclusiva com o KSCERATO disponível no nosso YouTube!",
];