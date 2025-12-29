import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.emoji_events_outlined, color: Colors.orangeAccent),
            ],
          ),
          const SizedBox(height: 16),

          // Grid of achievements
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              AchievementTile(
                emoji: '📝',
                title: 'Consistent Logger',
                subtitle: '7 days in a row',
                active: true,
              ),
              AchievementTile(
                emoji: '💪',
                title: 'Protein Champion',
                subtitle: '0 protein daily',
                active: true,
              ),
              AchievementTile(
                emoji: '⚖️',
                title: 'Balanced Eater',
                subtitle: 'Perfect macro ratios',
                active: false,
              ),
              AchievementTile(
                emoji: '🌍',
                title: 'World Explorer',
                subtitle: 'Try 5 cuisines in a week',
                active: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AchievementTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final bool active;

  const AchievementTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: active ? Colors.redAccent.withOpacity(0.1) : const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: active ? Colors.redAccent.withOpacity(0.3) : Colors.grey.shade800,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.grey[300] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}