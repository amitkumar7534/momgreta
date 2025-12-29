import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/components/styles/textStyles.dart';

import '../../../utils/appUtils.dart';
import '../home_controller.dart';
import 'daily_comparison_dialog.dart';

class TodaysSummaryCard extends StatelessWidget {
  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    const Color proteinColor = AppColors.green;
    const Color carbsColor = AppColors.orangeColor;
    const Color fatColor = Color(0xFFB7B7B7);

    final total =
        (homeController.statusModel.value.today!.totalProtein ?? 0) +
        (homeController.statusModel.value.today!.totalCarbs ?? 0) +
        (homeController.statusModel.value.today!.totalFat ?? 0);
    final proteinPercent =
        homeController.statusModel.value.today!.totalProtein ?? 0 / total;
    final carbPercent =
        homeController.statusModel.value.today!.totalCarbs ?? 0 / total;
    final fatPercent =
        homeController.statusModel.value.today!.totalFat ?? 0 / total;

    final calories =
        (homeController.statusModel.value.today?.totalCalories ?? 0) -
        (homeController.statusModel.value.yesterday?.totalCalories ?? 0);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        border: Border.all(color: Colors.grey,width: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.53,
                child: Text(
                  (homeController.dateTime != homeController.dateTimeToday)
                      ?(homeController.dateTime.isAtSameMomentAs(homeController.dateTimeYesterday))
                      ? "Yesterday's Meals"
                      :  "${AppUtils.dateFormat(homeController.dateTime)}'s Summary"
                      : "Today's Summary",
                  style: 17.txtBoldWhite,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange),
                ),
                child: const Text(
                  'Needs Attention',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(LucideIcons.utensils, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Obx(() {
                return Text(
                  '${homeController.statusModel.value.today!.meals!.length} meals',
                  style: 16.txtBoldGrey,
                );
              }),
              SizedBox(width: 16),
              Icon(LucideIcons.heart, size: 16, color: Colors.grey),
              SizedBox(width: 4),

              Obx(() {
                return Text(
                  'Health mix: ${homeController.statusModel.value.today!.healthTagCounts!.light??0}L/ ${homeController.statusModel.value.today!.healthTagCounts!.balanced??0}B/${homeController.statusModel.value.today!.healthTagCounts!.heavy??0}H',
                  style: 16.txtBoldGrey,
                );
              }),
              // Text('Health mix: 0L/0B/0H', style: 16.txtBoldGrey),
              SizedBox(width: 5),
              Icon(LucideIcons.info, color: Colors.grey, size: 16),
            ],
          ),
          const SizedBox(height: 30),

          // Row(
          //   children: [
          //     Expanded(
          //       flex: 3,
          //       child: Container(
          //         height: 15,
          //         decoration: BoxDecoration(
          //           color: proteinColor,
          //           borderRadius: const BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             bottomLeft: Radius.circular(20),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 4,
          //       child: Container(height: 15, color: carbsColor),
          //     ),
          //     Expanded(
          //       flex: 3,
          //       child: Container(
          //         height: 15,
          //         decoration: const BoxDecoration(
          //           color: fatColor,
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(20),
          //             bottomRight: Radius.circular(20),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 17,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex:
                        (homeController.statusModel.value.today!.totalProtein ==
                            0)
                        ? 30
                        : (proteinPercent * 1000).round(),
                    child: Container(color: AppColors.green), // Green
                  ),
                  Expanded(
                    flex:
                        (homeController.statusModel.value.today!.totalCarbs ==
                            0)
                        ? 30
                        : (carbPercent * 1000).round(),
                    child: Container(color: const Color(0xFFF39C12)), // Orange
                  ),
                  Expanded(
                    flex:
                        (homeController.statusModel.value.today!.totalFat == 0)
                        ? 30
                        : (fatPercent * 1000).round(),
                    child: Container(color: const Color(0xFFB0B0B0)), // Grey
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),
          Obx(() {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: _LegendDot(
                      color: proteinColor,
                      label:
                          'Protein ${AppUtils.removeTrailingZero(homeController.statusModel.value.today!.totalProtein.toString())}g',
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: _LegendDot(
                      color: carbsColor,
                      label:
                          'Carbs ${AppUtils.removeTrailingZero(homeController.statusModel.value.today!.totalCarbs.toString())}g',
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: _LegendDot(
                      color: fatColor,
                      label:
                          'Fat ${AppUtils.removeTrailingZero(homeController.statusModel.value.today!.totalFat.toString())}g',
                    ),
                  ),
                ),
              ],
            );
          }),

          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Obx(() {
                  return Text(
                    AppUtils.removeTrailingZero(
                      homeController.statusModel.value.today!.totalCalories
                          .toString(),
                    ),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
                const Text(
                  'calories today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                if (homeController.dateTime == homeController.dateTimeToday &&
                    homeController.statusModel.value.today!.totalCalories! > 0)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => DailyComparisonDialog(),
                      );
                    },
                    child: Stack(
                      children: [
                        Text(
                          (!calories.toString().contains("-"))
                              ? '+${AppUtils.removeTrailingZero(calories.toString())} vs yesterday'
                              : '${AppUtils.removeTrailingZero(calories.toString())} vs yesterday',
                          style: TextStyle(
                            color: (!calories.toString().contains("-"))?AppColors.green:AppColors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1,
                            color: (!calories.toString().contains("-"))?AppColors.green:AppColors.red, // Your custom underline color here
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: 14.txtBoldGrey),
      ],
    );
  }
}
