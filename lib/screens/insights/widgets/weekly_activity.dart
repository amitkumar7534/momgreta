import 'package:flutter/material.dart';

class WeeklyActivityCard extends StatelessWidget {
  const WeeklyActivityCard({super.key});

  final List<Map<String, dynamic>> data = const [
    {"day": "Mon", "meals": 0, "calories": 0},
    {"day": "Tue", "meals": 0, "calories": 0},
    {"day": "Wed", "meals": 0, "calories": 0},
    {"day": "Thu", "meals": 0, "calories": 0},
    {"day": "Fri", "meals": 0, "calories": 0},
    {"day": "Sat", "meals": 0, "calories": 0},
    {"day": "Sun", "meals": 0, "calories": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'This Week\'s Activity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '0 cal',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Saturday was your heaviest day despite just 3 meals.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ...data.map((entry) => _buildDayRow(entry)).toList(),
        ],
      ),
    );
  }

  Widget _buildDayRow(Map<String, dynamic> entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 40, child: Text(entry['day'])),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("${entry['meals']} meals",
                    style: const TextStyle(fontSize: 12)),
              ),
            ],
          ),
          Text("${entry['calories']} cal"),
        ],
      ),
    );
  }
}
