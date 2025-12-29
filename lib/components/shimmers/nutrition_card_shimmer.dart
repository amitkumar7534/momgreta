import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NutritionCardShimmer extends StatelessWidget {
  const NutritionCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,      // Darker base
      highlightColor: Colors.grey.shade700, // Lighter highlight
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -----------------------------
            // First Row: Calories + Macros
            // -----------------------------
            Row(
              children: [
                // Circular Calories placeholder
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade600, // Lighter grey for visibility
                  ),
                ),
                const SizedBox(width: 20),

                // Macro columns
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 10,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 30,
                            height: 10,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Divider shimmer
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade600,
            ),

            const SizedBox(height: 20),

            // --------------------------------
            // Bottom Row: Meal Type + Portion
            // --------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Meal Type
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          height: 10,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: 60,
                          height: 12,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    )
                  ],
                ),

                // Portion
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 10,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(height: 6),
                        Container(
                          width: 40,
                          height: 12,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
