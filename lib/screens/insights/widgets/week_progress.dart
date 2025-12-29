
import 'package:flutter/material.dart';

import '../../../components/styles/appColors.dart';

class WeekProgressCard extends StatelessWidget {
  final List<ProgressItem> items = [
    ProgressItem("Calories", 0, 100),
    ProgressItem("Protein", 0, 100),
    ProgressItem("Carbs", 0, 100),
    ProgressItem("Fat", 0, 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Week's Progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.trending_up, color: Colors.greenAccent),
            ],
          ),
          SizedBox(height: 16),
          ...items.map((item) => ProgressRow(item: item)).toList(),
        ],
      ),
    );
  }
}

class ProgressItem {
  final String title;
  final int current;
  final int target;

  ProgressItem(this.title, this.current, this.target);

  double get percent => current / target;
  String get percentString => "${(percent * 100).toStringAsFixed(1)}% of target";
}

class ProgressRow extends StatelessWidget {
  final ProgressItem item;

  const ProgressRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title + Values + Status
          Row(
            children: [
              Text(
                item.title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Text(
                "${item.current} / ${item.target}",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "On track",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
          SizedBox(height: 6),
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: item.percent,
              minHeight: 8,
              backgroundColor: Colors.brown[900],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            ),
          ),
          SizedBox(height: 4),
          Text(
            item.percentString,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          )
        ],
      ),
    );
  }
}