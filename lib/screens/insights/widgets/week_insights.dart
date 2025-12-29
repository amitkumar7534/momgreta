import 'package:flutter/material.dart';

class WeekInsightsScreen extends StatelessWidget {
  const WeekInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.trending_up, color: Colors.red),
              SizedBox(width: 5,),
              const Text(
                "Weekly Insights",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: const [
              WeeklyInsightCard(
                title: "Hidden Patterns",
                value: "0x",
                description: "Your dinners were 3× heavier than breakfasts.",
                color: Color(0xFF2E4D3B),
              ),
              SizedBox(width: 10,),
              WeeklyInsightCard(
                title: "Cooking Style Impact",
                value: "0%",
                description: "Calories dropped on grilled vs fried days.",
                color: Color(0xFF4C3C36),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: const [
              WeeklyInsightCard(
                title: "Meal Timing Effect",
                value: "0%",
                description: "Skipping breakfast led to 35% more calories at dinner.",
                color: Color(0xFF5A353B),
              ),
              SizedBox(width: 10,),
              WeeklyInsightCard(
                title: "Untimely Meals",
                value: "0",
                description: "You had 0 meals outside breakfast, lunch, or dinner this week.",
                color: Color(0xFF3B3B3D),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class WeeklyInsightCard extends StatelessWidget {
  final String title;
  final String value;
  final String description;
  final Color color;

  const WeeklyInsightCard({
    super.key,
    required this.title,
    required this.value,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}