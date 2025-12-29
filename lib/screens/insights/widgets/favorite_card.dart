import 'package:flutter/material.dart';
import 'package:momgreta/components/coreComponents/TextView.dart';
import 'package:momgreta/utils/extensions/text_style.dart';

import '../../../components/styles/appColors.dart';

class FavoriteCuisineCard extends StatelessWidget {
  const FavoriteCuisineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            children: [

              SizedBox(width: 5,),
              const Text(
                "Favorite Cuisines",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "0%",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Italian was your #0 cuisine this week.",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          _buildCuisineRow("Asian", 0, isTrending: true),
          _buildCuisineRow("Mexican", 0),
          SizedBox(height: 20,),
          TextView(text: "Asian meals are trending up (0% vs last week)",style: 14.txtMediumGrey,),
          SizedBox(height: 20,),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: "Top cuisines from 0 total meals",style: 12.txtMediumGrey,),
              Row(
                children: [
                  Icon(Icons.trending_up,color: Colors.grey,),
                  SizedBox(width: 5,),
                  TextView(text: "Trending up",style: 12.txtMediumGrey,),
                ],
              ),
            ],
          )
        ],

      ),
    );
  }

  Widget _buildCuisineRow(String name, double percent, {bool isTrending = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(width: 60, child: Text(name)),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 6,
              backgroundColor: Colors.grey.shade800,
              color: isTrending ? Colors.red : AppColors.green,
            ),
          ),
          const SizedBox(width: 8),
          Text("${(percent * 100).toInt()}%"),
        ],
      ),
    );
  }
}
