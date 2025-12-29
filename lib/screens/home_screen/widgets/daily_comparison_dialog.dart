import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momgreta/utils/appUtils.dart';

import '../../../components/styles/appColors.dart';
import '../home_controller.dart';

class DailyComparisonDialog extends StatelessWidget {
   DailyComparisonDialog({super.key});

  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF2B2B2B),
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Header =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.trending_up, color: Colors.greenAccent, size: 22),
                      SizedBox(width: 8),
                      Text(
                        "Daily Comparison",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.grey, size: 20),
                  )
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                "Compare today's nutrition and meal data with yesterday's to track your progress.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 16),


              const SizedBox(height: 10),

              // ===== Data Rows =====
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Column(
                  children: [
                    // Header Row
                    // ===== Section Header =====
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A2E2E),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Daily Comparison",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    _headerRow(),
                    _divider(),

                    // Data Rows
                    _metricRow("🔴 Calories", AppUtils.removeTrailingZero("${homeController.statusModel.value.yesterday!.totalCalories ?? 0}"),AppUtils.removeTrailingZero("${homeController.statusModel.value.today!.totalCalories ?? 0}"), '${AppUtils.removeTrailingZero(homeController.statusModel.value.changes!.calories!.percentage.toString())}%', Colors.redAccent),
                    _divider(),
                    _metricRow("🟢 Protein", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.yesterday!.totalProtein ?? 0}")}g","${AppUtils.removeTrailingZero("${homeController.statusModel.value.today!.totalProtein ?? 0}")}g", '${AppUtils.removeTrailingZero(homeController.statusModel.value.changes!.protein!.percentage.toString())}%', Colors.greenAccent),
                    _divider(),
                    _metricRow("🟠 Carbs", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.yesterday!.totalCarbs ?? 0}")}g", '${AppUtils.removeTrailingZero("${homeController.statusModel.value.today!.totalCarbs ?? 0}")}g', '${AppUtils.removeTrailingZero(homeController.statusModel.value.changes!.carbs!.percentage.toString())}%', Colors.orangeAccent),
                    _divider(),
                    _metricRow("⚪ Fat", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.yesterday!.totalFat ?? 0}")}g", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.today!.totalFat ?? 0}")}g", '${AppUtils.removeTrailingZero(homeController.statusModel.value.changes!.fat!.percentage.toString())}%', Colors.redAccent),
                    _divider(),
                    _metricRow("🔴 Health Score", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.yesterday!.healthScore ?? 0}")}/10", "${AppUtils.removeTrailingZero("${homeController.statusModel.value.today!.healthScore ?? 0}")}/10",homeController.statusModel.value.changes!.healthScore!.absolute.toString(), Colors.redAccent),
                    _divider(),
                    _metricRow("🟢 Meals", "${homeController.statusModel.value.yesterday!.meals!.length}", "${homeController.statusModel.value.today!.meals!.length}", homeController.statusModel.value.changes!.mealCount!.absolute.toString(), Colors.greenAccent),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ===== Bottom Cards =====
             /* Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF184E2C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Row(
                            children: [
                              Icon((homeController.statusModel.value.summary!.overallTrend.toString() == "Improving")?Icons.trending_up:Icons.trending_down, color: Colors.greenAccent, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Overall Trend",
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            homeController.statusModel.value.summary!.overallTrend.toString(),
                            style: TextStyle(
                              color: (homeController.statusModel.value.summary!.overallTrend.toString() == "Improving")?AppColors.green:AppColors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF303030),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                              SizedBox(width: 6),
                              Text(
                                "Consistency",
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            homeController.statusModel.value.summary!.consistency.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  // ===== Helper Widgets =====

  Widget _headerRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Expanded(flex: 2, child: _HeaderText("Metric")),
          Expanded(flex: 1, child: _HeaderText("Yesterday\n${homeController.statusModel.value.yesterday!.date}")),
          Expanded(flex: 1, child: _HeaderText("Today\n${homeController.statusModel.value.today!.date}")),
          Expanded(flex: 1, child: _HeaderText("Change")),
        ],
      ),
    );
  }

  Widget _metricRow(
      String metric,
      String yesterday,
      String today,
      String change,
      Color color,
      ) {

    bool isPositive = false;
    if(metric.contains("Calories") || metric.contains("Protein") || metric.contains("Carbs") || metric.contains("Fat") || metric.contains("Meals")){
      var yes = yesterday.replaceAll("g", "");
      var tod = today.replaceAll("g", "");
      var yesterdayValue = double.parse(yes);
      var todayValue = double.parse(tod);
      isPositive = todayValue > yesterdayValue;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(metric,
                style: const TextStyle(color: Colors.white, fontSize: 13)),
          ),
          Expanded(
            flex: 1,
            child: Text(yesterday,
                style: const TextStyle(color: Colors.white, fontSize: 13)),
          ),

          if(metric.contains("Calories"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.red: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if(metric.contains("Protein"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.green: AppColors.red,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if(metric.contains("Carbs"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.red: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if(metric.contains("Fat"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.red: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if(metric.contains("Meals"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.red: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          if(metric.contains("Health"))Expanded(
            flex: 1,
            child: Text(
              today,
              style: TextStyle(
                color: isPositive ? AppColors.red: AppColors.green,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (change.contains("-"))
                      ? Colors.grey.withOpacity(0.2)
                      : AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  change,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(
    color: Colors.grey.shade900,
    height: 0,
    thickness: 0.6,
  );
}

class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
