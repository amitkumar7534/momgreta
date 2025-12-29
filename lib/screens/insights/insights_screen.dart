import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momgreta/components/styles/textStyles.dart';
import 'package:momgreta/utils/extensions/widget.dart';

import '../../components/styles/appColors.dart';
import '../home_screen/home_controller.dart';
import 'attendance_model.dart';

enum ActivityFilter { all, checkIn, checkOut }

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final HomeController homeController = Get.find<HomeController>();

  ActivityFilter selectedFilter = ActivityFilter.all;
  int notificationCount = 2;

  @override
  void initState() {
    super.initState();
    homeController.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        top: false,
        child: Column(

          children: [
            _buildHeader(),
            _buildFilters(),
            Expanded(child: _buildActivityList()),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // HEADER
  // ---------------------------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mom',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Greta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
/*
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  LucideIcons.bell,
                  color: AppColors.white,
                  size: 22,
                ),
              ),
*/
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Activity History',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // FILTERS
  // ---------------------------------------------------------------------------

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('All', ActivityFilter.all),
            const SizedBox(width: 10),
            _buildFilterChip('Check In', ActivityFilter.checkIn),
            const SizedBox(width: 10),
            _buildFilterChip('Check Out', ActivityFilter.checkOut),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, ActivityFilter filter) {
    final isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () => setState(() => selectedFilter = filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryBlue
                : AppColors.grey.withOpacity(0.25),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // ACTIVITY LIST
  // ---------------------------------------------------------------------------

  Widget _buildActivityList() {
    return Obx(() {
      final list = homeController.attendanceList;

      if (homeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (list.isEmpty) {
        return const Center(child: Text('No activity found',style: TextStyle(color: AppColors.black,fontSize: 20,fontFamily: Family.bold),));
      }

      final filteredList = applyTypeFilter(list);

      if (filteredList.isEmpty) {
        return const Center(child: Text('No activity found',style: TextStyle(color: AppColors.black,fontSize: 20,fontFamily: Family.bold),));
      }

      final Map<String, List<AttendanceItem>> grouped = {};

      for (final item in filteredList) {
        if (item.actionAt == null) continue;

        final date = DateTime.tryParse(item.actionAt!);
        if (date == null) continue;

        final label = groupLabel(date);
        grouped.putIfAbsent(label, () => []).add(item);
      }

      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: grouped.entries.expand((entry) {
          return  [
            _buildDateDivider(entry.key),
            const SizedBox(height: 16),
            ...entry.value.map(_buildActivityCard),
            const SizedBox(height: 24),
          ];
        }).toList(),
      );
    });
  }

  String groupLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final d = DateTime(date.year, date.month, date.day);

    if (d == today) return 'Today';
    if (d == yesterday) return 'Yesterday';

    return DateFormat('MMM d, yyyy').format(date);
  }

  // ---------------------------------------------------------------------------
  // HELPERS
  // ---------------------------------------------------------------------------

  List<AttendanceItem> applyTypeFilter(List<AttendanceItem> list) {
    if (selectedFilter == ActivityFilter.all) return list;

    if (selectedFilter == ActivityFilter.checkIn) {
      return list.where((e) => e.type == 'CHECK_IN').toList();
    }

    if (selectedFilter == ActivityFilter.checkOut) {
      return list.where((e) => e.type == 'CHECK_OUT').toList();
    }

    return list;
  }

  String _formatDate(DateTime date) => DateFormat('MMM d, yyyy').format(date);

  String _formatTime(DateTime date) {
    // Convert UTC to local time zone
    final localDate = date.toLocal();
    return DateFormat('h:mm a').format(localDate);
  }
  Widget _buildDateDivider(String label) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.grey.withOpacity(0.25),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.grey.withOpacity(0.25),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // ACTIVITY CARD - MATCHES DESIGN
  // ---------------------------------------------------------------------------

  Widget _buildActivityCard(AttendanceItem item) {
    final isCheckIn = item.type == 'CHECK_IN';
    final accentColor = isCheckIn
        ? const Color(0xFF4CAF50) // Green
        : const Color(0xFFFF9800); // Orange

    final dateTime = DateTime.parse(item.actionAt!);

    // Check if user is a parent and get relationship
    final isParent = item.user?.role?.toLowerCase() == 'parent';
    final relationship = item.user?.relation ?? ''; // Assuming you have this field

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Colored left border INSIDE the card
          Container(
            width: 5,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon with background
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      isCheckIn ? LucideIcons.check : LucideIcons.log_out,
                      color: accentColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and status badge row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           /* Text(
                              isCheckIn ? 'Check In' : 'Check Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),*/
                            30.width,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                isCheckIn ? 'Checked In' : 'Checked Out',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // User name and role/relationship
                        Row(
                          children: [
                            Text(
                              item.user?.name ?? 'Unknown',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                // Show relationship if parent, otherwise show role
                                isParent && relationship.isNotEmpty
                                    ? relationship
                                    : (item.user?.role ?? 'Guest'),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Only show children for parents
                        if (item.user?.role?.toUpperCase() == 'PARENT' &&
                            item.children != null &&
                            item.children!.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                LucideIcons.users,
                                size: 14,
                                color: AppColors.grey.withOpacity(0.6),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  item.children!.map((child) => child.name ?? '').join(', '),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 10),
                        // Date and time
                        Row(
                          children: [
                            Icon(
                              LucideIcons.calendar,
                              size: 14,
                              color: AppColors.grey.withOpacity(0.6),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _formatDate(dateTime),
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.grey.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              LucideIcons.clock,
                              size: 14,
                              color: AppColors.grey.withOpacity(0.6),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _formatTime(dateTime),
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.grey.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}