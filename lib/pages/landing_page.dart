  import 'package:flutter/material.dart';
  import 'chat_page.dart';

  class LandingPage extends StatelessWidget {
    const LandingPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildHeroSection(context),

                _buildFeaturesSection(),

                _buildPlayersSection(context),

                _buildCTASection(context),

                _buildFooter(),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildHeroSection(BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(top: 24, bottom: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/furia_logo.png',
                  height: 32,
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              'CONECTE-SE AO TIME COM O FURIA CHATBOT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Interaja em tempo real com a FURIA e receba atualizações exclusivas!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'COMEÇAR AGORA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildFeaturesSection() {
      return Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            const Text(
              'RECURSOS EXCLUSIVOS',
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'O que você vai experimentar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 32),

            Column(
              children: [
                _buildFeatureCard(
                  icon: Icons.sports_esports,
                  title: 'Resultados em Tempo Real',
                  description: 'Atualizações instantâneas dos jogos',
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  icon: Icons.calendar_today,
                  title: 'Data dos Jogos',
                  description: 'Saiba quando será os proximos jogos',
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  icon: Icons.star,
                  title: 'Votação de MVP',
                  description: 'Participe escolhendo o melhor jogador',
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  icon: Icons.notifications,
                  title: 'Alertas Personalizados',
                  description: 'Não perca nenhum momento importante',
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildFeatureCard({
      required IconData icon,
      required String title,
      required String description,
    }) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF222222),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFFD700),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: const Color(0xFFFFD700),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildPlayersSection(BuildContext context) {
      final players = [
        {'name': 'arT', 'role': 'IGL'},
        {'name': 'KSCERATO', 'role': 'Entry Fragger'},
        {'name': 'yuurih', 'role': 'Lurker'},
        {'name': 'Chelo', 'role': 'Support'},
        {'name': 'FalleN', 'role': 'AWPer'},
      ];

      return Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            const Text(
              'CONHEÇA O TIME',
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Os Campeões da FURIA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return Container(
                    width: 120,
                    margin: EdgeInsets.only(
                      right: index == players.length - 1 ? 0 : 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF1A1A1A),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: const Color(0xFFFFD700).withOpacity(0.1),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Color(0xFFFFD700),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          player['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          player['role']!,
                          style: const TextStyle(
                            color: Color(0xFFFFD700),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildCTASection(BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            const Text(
              'PRONTO PARA SE CONECTAR?',
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Junte-se à revolução FURIA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Baixe agora e faça parte da comunidade mais apaixonada do CS:GO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 32),

            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChatPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD700),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'INICIAR CHAT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildFooter() {
      return Container(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Image.asset(
              'assets/furia_logo.png',
              height: 32,
            ),
            const SizedBox(height: 16),
            const Text(
              '© 2025 FURIA Esports.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    }
  }
