import 'package:flutter/material.dart';

import '../../../components/styles/appColors.dart';

class TopIngredientsScreen extends StatelessWidget {
  const TopIngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IngredientUsageCard();
  }
}

class IngredientUsageCard extends StatelessWidget {
  const IngredientUsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.energy_savings_leaf,color: AppColors.green,),
              SizedBox(width: 5,),
              const Text(
                'Top Ingredients',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '0x',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'chicken was your most-used ingredient this week.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          _buildIngredientRow("Rice", 0, Colors.red),
          _buildIngredientRow("Tomatoes", 0, Colors.orange),
          _buildIngredientRow("Cheese", 0, AppColors.green),
          const SizedBox(height: 10),
          const Text(
            "rice rose 0 vs last week",
            style: TextStyle(fontSize: 12, color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget _buildIngredientRow(String name, int times, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(name)),
          Expanded(
            child: LinearProgressIndicator(
              value: times / 12,
              minHeight: 6,
              backgroundColor: Colors.grey.shade800,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text("${times}x"),
        ],
      ),
    );
  }
}