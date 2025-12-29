import 'package:flutter/material.dart';



Widget BadgesScreen(){
  final List<Map<String, String>> achievements = const [
    {
      'emoji': '🌅',
      'title': 'Early Bird',
      'subtitle': '30 breakfast logs',
    },
    {
      'emoji': '🔥',
      'title': 'Streak Master',
      'subtitle': '14-day streak',
    },
    {
      'emoji': '🗺️',
      'title': 'Explorer',
      'subtitle': '10 cuisines tried',
    },
    {
      'emoji': '💚',
      'title': 'Health Guru',
      'subtitle': '50 healthy meals',
    },
    {
      'emoji': '⭐',
      'title': 'Social Star',
      'subtitle': '100 total likes',
    },
    {
      'emoji': '💪',
      'title': 'Protein Pro',
      'subtitle': 'Hit protein goals 20 times',
    },
  ];
  return Padding(
    padding: const EdgeInsets.all(12),
    child: GridView.builder(
      itemCount: achievements.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final item = achievements[index];
        return AchievementCard(
          emoji: item['emoji']!,
          title: item['title']!,
          subtitle: item['subtitle']!,
        );
      },
    ),
  );
}


class AchievementCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;

  const AchievementCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF00D67A),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}