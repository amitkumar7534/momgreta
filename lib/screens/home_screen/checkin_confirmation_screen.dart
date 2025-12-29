import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momgreta/components/styles/appColors.dart';
import 'package:momgreta/utils/extensions/extensions.dart';

import '../home_screen/home_controller.dart';

class CheckInConfirmationScreen extends StatefulWidget {
  final String action; // "CHECK_IN" or "CHECK_OUT"

  const CheckInConfirmationScreen({super.key, required this.action});

  @override
  State<CheckInConfirmationScreen> createState() =>
      _CheckInConfirmationScreenState();
}

class _CheckInConfirmationScreenState
    extends State<CheckInConfirmationScreen> {
  late final HomeController homeController = Get.find<HomeController>();

  List<String> selectedChildrenIds = []; // Changed to List for multiple selection
  String? selectedRelation;

  @override
  Widget build(BuildContext context) {
    // Get user data from controller (stored after PIN verification)
    final userData = homeController.userVerificationResponse.value?.data;
    final isParent = userData?.role?.toUpperCase() == 'PARENT';
    final isStaff = userData?.role?.toUpperCase() == 'STAFF';

    if(homeController.userVerificationResponse.value!.data!.children!.isNotEmpty) {
      selectedChildrenIds.add(
          homeController.userVerificationResponse.value?.data?.children?.first
              .id ?? '');
    }
    // Get current time and location
    final now = DateTime.now();
    final timeString = DateFormat('h:mm a').format(now);
    final dateString = DateFormat('MMM d, yyyy').format(now);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Select Child (only for parents)
                    if (isParent && userData?.children != null) ...[
                      _buildSectionTitle('Select Child', isRequired: true),
                      const SizedBox(height: 12),
                      ...userData!.children!.map((child) {
                        return _buildChildCard(
                          childId: child.id ?? '',
                          childName: child.name ?? '',
                          childClass: 'Rainbow Class', // Make this dynamic
                          childAge: 'Age 4', // Make this dynamic
                          isSelected: selectedChildrenIds.contains(child.id),
                          onTap: () {
                            setState(() {
                              if (selectedChildrenIds.contains(child.id)) {
                                selectedChildrenIds.remove(child.id);
                              } else {
                                selectedChildrenIds.add(child.id ?? '');
                              }
                            });
                          },
                        );
                      }).toList(),
                      const SizedBox(height: 24),
                    ],

                    // Select Child (for staff - make it required)
                    if (isStaff) ...[
                      //  _buildSectionTitle('Select Child', isRequired: true),
                      //   const SizedBox(height: 12),
                      //  _buildChildDropdown(),
                      //  const SizedBox(height: 24),
                    ],

                    // Your Relation (only for parents)
                    if (isParent) ...[
                      _buildSectionTitle('Your Relation', isRequired: true),
                      const SizedBox(height: 12),
                      _buildRelationDropdown(userData?.relation),
                      const SizedBox(height: 24),
                    ],

                    // Auto-detected Information
                    _buildSectionTitle('Auto-detected information'),
                    const SizedBox(height: 12),

                    // Time & Date
                    _buildInfoCard(
                      icon: LucideIcons.clock,
                      iconColor: widget.action == 'CHECK_OUT' ? AppColors.buttonColor : AppColors.green,
                      title: 'Time & Date',
                      value: '$timeString • $dateString',
                    ),
                    const SizedBox(height: 12),

                    // Location
                    _buildInfoCard(
                      icon: LucideIcons.map_pin,
                      iconColor: widget.action == 'CHECK_OUT' ? AppColors.buttonColor : AppColors.green,
                      title: 'Location',
                      value: 'MomGreta Preschool',
                    ),
                    const SizedBox(height: 32),

                    // Complete Check In/Out Button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _canComplete()
                            ? () => _completeAction()
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _canComplete()
                              ? (widget.action == 'CHECK_OUT' ? AppColors.buttonColor : AppColors.green)
                              : AppColors.grey.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              widget.action == 'CHECK_IN'
                                  ? LucideIcons.check
                                  : LucideIcons.log_out,
                              color: _canComplete()
                                  ? AppColors.white
                                  : AppColors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.action == 'CHECK_IN'
                                  ? 'COMPLETE CHECK IN'
                                  : 'COMPLETE CHECK OUT',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: _canComplete()
                                    ? AppColors.white
                                    : AppColors.grey,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isCheckOut = widget.action == 'CHECK_OUT';
    final headerColor = isCheckOut ? AppColors.buttonColor : AppColors.green;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                LucideIcons.chevron_left,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mom',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Greta',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 40), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool isRequired = false}) {
    final iconColor = widget.action == 'CHECK_OUT' ? AppColors.buttonColor : AppColors.green;

    return Row(
      children: [
        Icon(
          LucideIcons.users,
          size: 18,
          color: iconColor,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.blackText,
          ),
        ),
        if (isRequired) ...[
          const SizedBox(width: 4),
          Text(
            '*',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildChildCard({
    required String childId,
    required String childName,
    required String childClass,
    required String childAge,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final isCheckOut = widget.action == 'CHECK_OUT';
    final accentColor = isCheckOut ? AppColors.buttonColor : AppColors.green;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? accentColor
                : AppColors.grey.withOpacity(0.3),
            width: isSelected ? 2 : 1.5,
          ),
        ),
        child: Row(
          children: [
            // Radio button (circular)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? accentColor
                      : AppColors.grey.withOpacity(0.5),
                  width: 2,
                ),
                color: AppColors.white,
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor,
                  ),
                ),
              )
                  : null,
            ),
            const SizedBox(width: 12),
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: accentColor.withOpacity(0.2),
              child: Text(
                childName.isNotEmpty ? childName[0].toUpperCase() : 'C',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Child info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    childName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$childClass • $childAge',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChildDropdown() {
    // For staff members - dropdown to select any child
    // Note: For multiple selection, you might want to use a multi-select dropdown
    // or show all children as checkboxes instead
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedChildrenIds.isNotEmpty ? selectedChildrenIds.first : null,
          hint: Text(
            selectedChildrenIds.isEmpty
                ? 'Select a child'
                : '${selectedChildrenIds.length} child(ren) selected',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.grey,
            ),
          ),
          isExpanded: true,
          icon: Icon(LucideIcons.chevron_down, size: 20),
          items: [
            // Add all children from your database/API here
            DropdownMenuItem(
              value: '65a8c0e1f23c9a0012ab1111',
              child: Text('Emma Williams'),
            ),
            DropdownMenuItem(
              value: '65a8c0e1f23c9a0012ab2222',
              child: Text('John Doe'),
            ),
            // Add more children dynamically
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                if (selectedChildrenIds.contains(value)) {
                  selectedChildrenIds.remove(value);
                } else {
                  selectedChildrenIds.add(value);
                }
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildRelationDropdown(String? currentRelation) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.white,
          value: selectedRelation ?? currentRelation,
          isExpanded: true,
          icon: Icon(LucideIcons.chevron_down, size: 20),
          items: [
            DropdownMenuItem(
              value: 'MOTHER',
              child: Text('Mother',style: TextStyle(color: AppColors.black),),
            ),
            DropdownMenuItem(
              value: 'FATHER',
              child: Text('Father',style: TextStyle(color: AppColors.black)),
            ),
            DropdownMenuItem(
              value: 'GUARDIAN',
              child: Text('Guardian',style: TextStyle(color: AppColors.black)),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedRelation = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Auto',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canComplete() {
    final userData = homeController.userVerificationResponse.value?.data;
    final isParent = userData?.role?.toUpperCase() == 'PARENT';
    final isStaff = userData?.role?.toUpperCase() == 'STAFF';

     if (isParent) {
      // Parents must select at least one child and relation
      return selectedChildrenIds.isNotEmpty &&
          (selectedRelation != null || userData?.relation != null);
    } else {
       return true;
     }

    return false;
  }

  Future<void> _completeAction() async {
    final userData = homeController.userVerificationResponse.value?.data;

    // Build request matching the API format
    Map<String, dynamic> checkInData = {
      "pin": userData?.pin,
      "type": widget.action,
      "children": selectedChildrenIds, // Array of child IDs
    };

    // Optionally add relation for parents if needed
    // if (userData?.role?.toUpperCase() == 'PARENT') {
    //   checkInData["relation"] = selectedRelation ?? userData?.relation;
    // }

    // Call your API to complete check-in/out
    bool success = await homeController.completeCheckIn(context, checkInData).applyLoader;

    if (success) {
      // Navigate back and show success message
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.action == 'CHECK_IN'
                ? 'Check-in completed successfully!'
                : 'Check-out completed successfully!',
          ),
          backgroundColor: widget.action == 'CHECK_OUT' ? AppColors.buttonColor : AppColors.green,
        ),
      );
    }
  }
}